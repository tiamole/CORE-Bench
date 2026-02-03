# CORE-Bench: NeurIPS 2025 Paper

This directory contains the LaTeX source files for the CORE-Bench paper submission to NeurIPS 2025 Datasets and Benchmarks Track.

## Files

- `core_bench_paper.tex` - Main paper LaTeX source
- `references.bib` - Bibliography file
- `neurips_2025.sty` - NeurIPS 2025 style file
- `core_bench_paper.pdf` - Compiled paper

## Compilation

### Using latexmk (recommended)

```bash
latexmk -pdf core_bench_paper.tex
```

### Using pdflatex

```bash
pdflatex core_bench_paper.tex
bibtex core_bench_paper
pdflatex core_bench_paper.tex
pdflatex core_bench_paper.tex
```

## Required Figures

The paper references figures from `../figures/png/`:
- fig1_model_leaderboard.png
- fig2_family_comparison.png
- fig3_tier_distribution.png
- fig5_score_distribution.png
- fig8_performance_tiers.png
- fig10_performance_gap_analysis.png
- fig11_hierarchical_clustering.png
- fig12_family_dominance_dynamics.png
- fig13_thinking_vs_standard.png
- fig14_size_efficiency_frontier.png
- fig15_confidence_volatility.png
- fig16_similarity_clustering.png
- fig17_novel_insights_dashboard.png
- fig18_generation_evolution.png

Ensure these figures exist before compilation.

## Paper Structure

1. **Abstract** - Overview of CORE-Bench and key findings
2. **Introduction** - Motivation and contributions
3. **Related Work** - Prior reasoning benchmarks
4. **Benchmark Design** - Task categories and evaluation protocol
5. **Experimental Setup** - Model descriptions and infrastructure
6. **Results** - Performance analysis across 22 models
7. **Novel Critical Analysis** - Statistical methods and insights
8. **Discussion** - Key findings and implications
9. **Conclusion** - Summary and future work
10. **Appendix** - Complete leaderboard, example problems, statistical methods

## Key Statistics

- **22 Models Evaluated** across 4 families (Google, Anthropic, Alibaba/Qwen, DeepSeek)
- **18 Task Categories** covering 4 reasoning dimensions
- **Performance Range**: 21% - 88%
- **Top Performers**: Gemini 3 Flash Preview (88%), Qwen 3 Next 80B Thinking (88%)

## Citation

```bibtex
@inproceedings{feyijimi2025corebench,
  title={CORE-Bench: A Comprehensive Benchmark for Evaluating Reasoning Capabilities in Large Language Models},
  author={Feyijimi, Taiwo},
  booktitle={Advances in Neural Information Processing Systems},
  year={2025}
}
```

## Benchmark Access

https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench
