# CORE-Bench Copilot Instructions

## Project Overview

CORE-Bench is a comprehensive LLM reasoning benchmark evaluating 22 models across 4 cognitive dimensions: logical deduction, mathematical reasoning, causal analysis, and analogical thinking. Designed for Kaggle Benchmarks integration and NeurIPS 2025 publication.

## Architecture

```
reasoning_benchmark.ipynb         # Main benchmark - Kaggle-compatible (9000+ lines)
core_bench_publication_analysis.ipynb  # Visualization - 18 publication figures
leaderboard.json                  # Model results from Kaggle API
download_leaderboard.py           # Sync script via kaggle_benchmarks
figures/{png,svg,pdf}/            # Output at 300 DPI
neurips_paper/                    # LaTeX paper - NeurIPS 2025 submission
public_benchmarks/                # 8 benchmark datasets (320 questions)
```

## Key Data Patterns

### Leaderboard JSON Structure
```python
row = data['rows'][i]
model_name = row.get('modelVersionName') or row.get('modelVersionSlug')
score = task['result']['numericResult']['value']  # 0.0-1.0, multiply by 100 for %
```

### Model Family Detection
```python
def get_family(model_name):
    name = model_name.lower()
    if 'gemini' in name or 'gemma' in name: return 'Google'
    if 'claude' in name: return 'Anthropic'
    if 'qwen' in name: return 'Alibaba (Qwen)'
    if 'deepseek' in name: return 'DeepSeek'
    return 'Unknown'

FAMILY_COLORS = {
    'Google': '#4285F4', 'Anthropic': '#D97706',
    'Alibaba (Qwen)': '#7C3AED', 'DeepSeek': '#10B981'
}
```

### Task Categories (7 dimensions)
`logical_deduction`, `math_word_problems`, `causal_reasoning`, `analogical_reasoning`, `multi_step_planning`, `reasoning_quality_evaluation`, `comprehensive_reasoning_benchmark`

## Figure-to-Filename Mapping

| Figure | Filename | Description |
|--------|----------|-------------|
| 1 | `fig1_model_leaderboard.png` | Complete 22-model rankings |
| 2 | `fig2_family_comparison.png` | Family performance stats |
| 5 | `fig5_score_distribution.png` | Bimodal distribution |
| 10 | `fig10_performance_gap_analysis.png` | Pareto + KDE + Gini |
| 11 | `fig11_hierarchical_clustering.png` | Ward's dendrogram |
| 12 | `fig12_family_dominance_dynamics.png` | HHI concentration |
| 13 | `fig13_thinking_vs_standard.png` | Effect size comparison |
| 14 | `fig14_size_efficiency_frontier.png` | Scaling laws |
| 15 | `fig15_confidence_volatility.png` | Bootstrap intervals |
| 17 | `fig17_novel_insights_dashboard.png` | 8-panel synthesis |
| 18 | `fig18_generation_evolution.png` | Generation trends |

## Publication Figure Standards
```python
plt.rcParams.update({
    'figure.dpi': 150, 'savefig.dpi': 300,
    'font.family': 'sans-serif', 'font.size': 12,
    'axes.spines.top': False, 'axes.spines.right': False
})
```

## Kaggle API Setup
```bash
pip install kaggle kaggle-benchmarks
# Place kaggle.json in ~/.kaggle/ (Linux/Mac) or %USERPROFILE%\.kaggle\ (Windows)
# kaggle.json format: {"username":"YOUR_USERNAME","key":"YOUR_API_KEY"}
```

## Public Benchmarks Integration

The `public_benchmarks/` directory contains 8 datasets (320 questions total):
- **CORE-Bench**: Primary benchmark (40 questions)
- **GSM8K, MATH**: Mathematical reasoning
- **BIG-Bench, LogiQA**: Logical reasoning
- **ReClor**: Reading comprehension + logic
- **StrategyQA**: Multi-hop implicit reasoning
- **MedQA**: Domain-specific clinical reasoning

Each benchmark has `tier_a_count: 20` (basic) and `tier_b_count: 20` (advanced).

## Statistical Methods

| Method | Purpose | Key Result |
|--------|---------|------------|
| Pareto frontier | Capability concentration | Top 8 = 80% cumulative |
| Ward's clustering | Natural groupings | k=2, silhouette=0.776 |
| HHI | Market concentration | Elite tier >2800 |
| Bootstrap (n=1000) | Ranking uncertainty | Alibaba 66% P(#1) |
| Cohen's d | Thinking vs standard | d=0.238, +5.6% |

## NeurIPS Paper Compilation
```bash
cd neurips_paper
pdflatex core_bench_paper.tex && bibtex core_bench_paper && pdflatex core_bench_paper.tex && pdflatex core_bench_paper.tex
# Or: latexmk -pdf core_bench_paper.tex
```

Figure paths in LaTeX: `../figures/png/fig{N}_{name}.png`

## Dependencies
```
pandas, numpy, matplotlib, seaborn, scipy, scikit-learn
kaggle, kaggle_benchmarks (kbench)
```

## Contributing Questions
```python
{
    "premises": "...",
    "question": "...",
    "answer": "expected",  # "yes", "no", or specific value
    "reasoning_type": "logical|mathematical|causal|analogical",
    "difficulty": "basic|advanced"
}
```

## Common Tasks
- **Refresh leaderboard**: `python download_leaderboard.py`
- **Regenerate figures**: Run all cells in `core_bench_publication_analysis.ipynb`
- **Compile paper**: `cd neurips_paper && latexmk -pdf core_bench_paper.tex`
