# CORE-Bench: Comprehensive Ordered Reasoning Evaluation Benchmark

[![Kaggle](https://img.shields.io/badge/Kaggle-Benchmark-20BEFF?style=for-the-badge&logo=kaggle)](https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg?style=for-the-badge&logo=python)](https://www.python.org/downloads/)
[![NeurIPS 2025](https://img.shields.io/badge/NeurIPS-2025-red?style=for-the-badge)](https://neurips.cc/)

CORE-Bench is a comprehensive evaluation framework for Large Language Model (LLM) reasoning capabilities across four fundamental cognitive dimensions: logical deduction, mathematical problem-solving, causal analysis, and analogical thinking. The benchmark evaluates 22 state-of-the-art models from Google, Anthropic, Alibaba, and DeepSeek, providing 18 publication-quality analytical figures and novel insights into AI reasoning capabilities.

**Benchmark URL:** https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench

---

## Results Summary

### Complete Leaderboard

| Rank | Model | Family | Score |
|:----:|-------|--------|:-----:|
| 1 | Gemini 3 Flash Preview | Google | 88% |
| 1 | Qwen 3 Next 80B Thinking | Alibaba (Qwen) | 88% |
| 3 | Claude Opus 4.1 | Anthropic | 85% |
| 4 | Claude Haiku 4.5 | Anthropic | 83% |
| 4 | Claude Sonnet 4.5 | Anthropic | 83% |
| 4 | DeepSeek V3.1 | DeepSeek | 83% |
| 4 | Gemini 2.5 Flash | Google | 83% |
| 4 | Gemini 3 Pro Preview | Google | 83% |
| 4 | Qwen 3 Coder 480B | Alibaba (Qwen) | 83% |
| 4 | Qwen 3 Next 80B Instruct | Alibaba (Qwen) | 83% |
| 11 | Claude Opus 4.5 | Anthropic | 78% |
| 12 | DeepSeek V3.2 | DeepSeek | 77% |
| 12 | Gemini 2.5 Pro | Google | 77% |
| 14 | Gemini 2.0 Flash | Google | 69% |
| 14 | Gemini 2.0 Flash Lite | Google | 69% |
| 14 | Qwen 3 235B A22B Instruct | Alibaba (Qwen) | 69% |
| 17 | Claude Sonnet 4 | Anthropic | 61% |
| 18 | DeepSeek-R1 | DeepSeek | 46% |
| 19 | Gemma 3 12B | Google | 30% |
| 20 | Gemma 3 27B | Google | 23% |
| 20 | Gemma 3 4B | Google | 23% |
| 22 | Gemma 3 1B | Google | 21% |

### Key Statistics

| Metric | Value |
|--------|-------|
| Models Evaluated | 22 |
| AI Families | 4 (Google, Anthropic, Alibaba, DeepSeek) |
| Best Score | 88% |
| Worst Score | 21% |
| Mean Score | 67.5% |
| Median Score | 77.5% |
| Standard Deviation | 23.1% |
| Performance Gap | 67 percentage points |

### Family Performance

| Family | Mean | Std Dev | Min | Max | Models |
|--------|------|---------|-----|-----|--------|
| Alibaba (Qwen) | 80.75% | 8.18 | 69% | 88% | 4 |
| Anthropic | 78.00% | 9.85 | 61% | 85% | 5 |
| DeepSeek | 68.67% | 19.86 | 46% | 83% | 3 |
| Google | 56.60% | 28.55 | 21% | 88% | 10 |

---

## Research Contributions

CORE-Bench introduces 10 novel analytical methods to LLM evaluation:

| Contribution | Method | Key Finding |
|--------------|--------|-------------|
| Pareto Frontier Analysis | Cumulative capability assessment | Top 8 models contribute 80% of benchmark performance |
| Hierarchical Clustering | Ward's method with silhouette validation | 2 natural clusters (k=2, S=0.776) |
| Market Concentration | Herfindahl-Hirschman Index (HHI) | Elite tier highly concentrated (HHI > 2800) |
| Thinking Model Analysis | Cohen's d effect size | +5.6% advantage (d=0.238) |
| Efficiency Frontier | Scaling law regression | 7.9% gain per parameter doubling |
| Bootstrap Confidence | 1000-iteration resampling | Alibaba 66% probability of #1 family ranking |
| Tier Boundary Analysis | Swap probability estimation | 5 robust performance boundaries identified |
| Competitive Set Mapping | Performance band clustering | 4 substitution sets within 5% bands |
| Generation Evolution | Version progression tracking | +5.0% improvement per generation |
| Version Type Analysis | Release stage comparison | Preview/Beta models lead at 85.5% mean |

---

## Key Findings

### Performance Ceiling at 88%

Two architecturally different models achieve the top score:
- **Gemini 3 Flash Preview** (speed-optimized, medium-tier)
- **Qwen 3 Next 80B Thinking** (reasoning-enhanced, large-tier)

This convergence suggests current capability limits where training methodology matters more than raw scale.

### Natural Performance Clusters

Hierarchical clustering identifies two distinct groups:
- **Cluster 1**: Gemma models (21-30%)
- **Cluster 2**: Commercial models (46-88%)

The 16 percentage-point gap between clusters indicates qualitative capability differences, not merely quantitative scaling.

### Thinking Model Advantage

Reasoning-enhanced models show a +5.6 percentage point advantage:
- Thinking models mean: 73.3%
- Standard models mean: 67.7%
- Cohen's d = 0.238 (small but meaningful effect)
- p-value = 0.706 (not statistically significant with n=3)

### Scaling Laws

Performance scales logarithmically with model size:
- Approximately 7.9% gain per parameter doubling
- Gemma 3 1B achieves highest efficiency (21% per billion parameters)
- Diminishing returns above 100B parameters

### The Gemma Paradox

Within the Gemma 3 family, 27B underperforms 12B (23% vs 30%), suggesting scale alone is insufficient for reasoning capability.

---

## Benchmark Design

### Reasoning Dimensions

| Dimension | Tasks | Description |
|-----------|:-----:|-------------|
| Logical Deduction | 1A, 1B | Formal logic and syllogistic reasoning |
| Mathematical Reasoning | 2A, 2B | Quantitative problem-solving |
| Causal Reasoning | 3A, 3B | Cause-effect analysis and confounding |
| Analogical Reasoning | 4A, 4B | Structural similarity detection |
| Multi-Step Planning | 5A, 5B | Goal decomposition and constraint satisfaction |
| Reasoning Quality | 6A, 6B | Fallacy detection and argument validity |
| Comprehensive Integration | 7A, 7B | Multi-dimensional reasoning tasks |

### Evaluation Protocol

1. **Standardized Prompts**: Consistent task descriptions across all models
2. **Deterministic Sampling**: Temperature = 0 for reproducibility
3. **Automated Scoring**: Binary pass/fail per task, aggregate accuracy
4. **Public Leaderboard**: Real-time tracking on Kaggle Benchmarks

---

## Repository Structure

```
CORE-Bench/
├── Makefile                               # Build automation
├── requirements.txt                       # Python dependencies
├── README.md                              # This file
├── LICENSE                                # MIT License
├── reasoning_benchmark.ipynb              # Main benchmark (Kaggle-compatible)
├── core_bench_publication_analysis.ipynb  # Analysis and figure generation
├── download_leaderboard.py                # Kaggle API sync script
├── leaderboard.json                       # Current benchmark results
├── figures/                               # Publication-quality figures
│   ├── png/                               # 300 DPI PNG
│   ├── svg/                               # Vector graphics
│   └── pdf/                               # PDF format
├── neurips_paper/                         # NeurIPS 2025 submission (proprietary)
│   ├── core_bench_paper.tex               # LaTeX source
│   ├── core_bench_paper.pdf               # Compiled paper
│   └── references.bib                     # Bibliography
├── public_benchmarks/                     # 8 benchmark datasets (320 questions)
│   ├── core_bench_questions.json          # Primary benchmark
│   ├── gsm8k_questions.json               # Mathematical reasoning
│   ├── math_questions.json                # Competition mathematics
│   ├── bigbench_questions.json            # Logical reasoning
│   ├── logiqa_questions.json              # Standardized test logic
│   ├── reclor_questions.json              # Reading comprehension
│   ├── strategyqa_questions.json          # Multi-hop reasoning
│   └── medqa_questions.json               # Clinical reasoning
└── .github/copilot-instructions.md        # AI agent guidance
```

---

## Quick Start

### Using Make (Recommended)

```bash
# Clone the repository
git clone https://github.com/tiamole/CORE-Bench.git
cd CORE-Bench

# Full reproduction: setup environment and generate figures
make all

# Or step by step:
make setup          # Create virtual environment
make figures        # Generate all 18 figures
make leaderboard    # Download latest results

# See all available commands
make help
```

### Run on Kaggle

Visit [CORE-Bench on Kaggle](https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench) to evaluate models with standardized infrastructure.

### Manual Setup

```bash
# Clone the repository
git clone https://github.com/tiamole/CORE-Bench.git
cd CORE-Bench

# Install dependencies
pip install -r requirements.txt

# Run analysis notebook
jupyter notebook reasoning_benchmark.ipynb
```

### Reproduce Figures

```bash
# Generate all 18 publication figures
make figures

# Or manually:
jupyter nbconvert --execute core_bench_publication_analysis.ipynb --to html
```

### Refresh Leaderboard

```bash
make leaderboard

# Or manually:
python download_leaderboard.py
```

---

## Deployment Recommendations

| Use Case | Recommended Models | Rationale |
|----------|-------------------|-----------|
| High-stakes reasoning | Gemini 3 Flash, Qwen 3 Thinking | 88% accuracy |
| Cost-optimized production | Claude Haiku 4.5, Gemini 2.5 Flash | 83% at medium-tier pricing |
| Edge deployment | Gemma 3 12B | Best small model efficiency |
| Coding tasks | Qwen 3 Coder 480B | 83% with code specialization |
| Vendor diversification | Any 83% tier model | 7 interchangeable options |

---

## NeurIPS 2025 Paper

The full paper is available in `neurips_paper/`:

```bash
cd neurips_paper
latexmk -pdf core_bench_paper.tex
```

### Paper Structure

1. Introduction and motivation
2. Related work on reasoning benchmarks
3. Benchmark design and task categories
4. Experimental setup (22 models, 4 families)
5. Results and foundational analysis
6. Novel critical analysis (Figures 10-18)
7. Discussion and implications
8. Conclusion and future work

---

## Contributing

### Question Submission Format

```python
{
    "premises": "Your premises here",
    "question": "Your reasoning question",
    "answer": "expected_answer",
    "reasoning_type": "logical|mathematical|causal|analogical",
    "difficulty": "basic|advanced"
}
```

### Priority Areas

- New reasoning problems (multi-hop, adversarial, domain-specific)
- Additional model evaluations (open-source models, specialized variants)
- Extended analysis (temporal reasoning, spatial reasoning)
- Robustness testing (prompt sensitivity, consistency evaluation)

---

## Citation

```bibtex
@inproceedings{feyijimi2025corebench,
  author = {Feyijimi, Taiwo},
  title = {CORE-Bench: A Comprehensive Benchmark for Evaluating Reasoning Capabilities in Large Language Models},
  booktitle = {Advances in Neural Information Processing Systems},
  year = {2025},
  url = {https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench}
}
```

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Contact

- **Kaggle**: [@taiwofeyijimi](https://www.kaggle.com/taiwofeyijimi)
- **GitHub Issues**: [CORE-Bench Issues](https://github.com/tiamole/CORE-Bench/issues)
