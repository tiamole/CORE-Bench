#!/usr/bin/env python3
"""
Download leaderboard results from Kaggle Benchmarks API.

This script fetches the latest benchmark results for CORE-Bench
and updates the local leaderboard.json file.

Usage:
    python download_leaderboard.py

Requirements:
    - kaggle_benchmarks package
    - Valid Kaggle API credentials (~/.kaggle/kaggle.json)
"""

import json
import os
import sys
from datetime import datetime

# Optional imports with graceful fallback
try:
    import kaggle_benchmarks as kbench
    KBENCH_AVAILABLE = True
except ImportError:
    kbench = None
    KBENCH_AVAILABLE = False

try:
    from kaggle.api.kaggle_api_extended import KaggleApi
    api = KaggleApi()
    api.authenticate()
    KAGGLE_API_AVAILABLE = True
except ImportError:
    api = None
    KAGGLE_API_AVAILABLE = False

# Benchmark identifiers
BENCHMARK_SLUG = "taiwofeyijimi/core-bench-comprehensive-reasoning"
BENCHMARK_TASK_SLUG = "taiwofeyijimi/comprehensive-reasoning-benchmark"


def download_via_kbench():
    """Download leaderboard using kaggle_benchmarks library."""
    if not KBENCH_AVAILABLE:
        return None
    try:
        client = kbench.client
        leaderboard = client.get_leaderboard()
        return leaderboard if leaderboard else None
    except Exception:
        return None


def download_via_api():
    """Download benchmark results using Kaggle API directly."""
    if not KAGGLE_API_AVAILABLE:
        return None
    try:
        response = api.benchmark_list()
        return response
    except Exception:
        return None


def load_existing_leaderboard():
    """Load the existing leaderboard.json file."""
    leaderboard_path = "leaderboard.json"
    if os.path.exists(leaderboard_path):
        with open(leaderboard_path, 'r') as f:
            return json.load(f)
    return None

def main():
    """Main entry point for leaderboard download."""
    print(f"CORE-Bench Leaderboard Download - {datetime.now().strftime('%Y-%m-%d %H:%M')}")
    
    leaderboard_data = None
    
    # Try kaggle_benchmarks first
    if KBENCH_AVAILABLE:
        leaderboard_data = download_via_kbench()
    
    # Try Kaggle API
    if not leaderboard_data and KAGGLE_API_AVAILABLE:
        leaderboard_data = download_via_api()
    
    # Fall back to existing file
    if not leaderboard_data:
        leaderboard_data = load_existing_leaderboard()
    
    if leaderboard_data:
        # Save the leaderboard file
        output_path = "leaderboard.json"
        with open(output_path, 'w') as f:
            json.dump(leaderboard_data, f, indent=2)
        
        # Print summary
        rows = leaderboard_data.get('rows', [])
        print(f"Total models: {len(rows)}")
        
        for row in rows:
            model_name = row.get('modelVersionName') or row.get('modelVersionSlug', 'Unknown')
            task_results = row.get('taskResults', [])
            
            # Extract comprehensive benchmark score
            comp_score = None
            for task in task_results:
                if task.get('benchmarkTaskName') == 'comprehensive_reasoning_benchmark':
                    result = task.get('result', {})
                    if result.get('hasNumericResult'):
                        comp_score = result.get('numericResult', {}).get('value', 0)
            
            if comp_score is not None:
                print(f"  {model_name}: {comp_score*100:.1f}%")
        
        return True
    else:
        print("Could not fetch leaderboard data")
        return False


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
