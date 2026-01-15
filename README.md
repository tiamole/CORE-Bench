# 🧠 CORE-Bench: Comprehensive Ordered Reasoning Evaluation Benchmark

[![Kaggle](https://img.shields.io/badge/Kaggle-Benchmark-20BEFF?style=for-the-badge&logo=kaggle)](https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg?style=for-the-badge&logo=python)](https://www.python.org/downloads/)

> **CORE-Bench** evaluates LLM reasoning across four dimensions: logical deduction, mathematical problem-solving, causal analysis, and analogical thinking. 51 curated problems assess systematic reasoning, fallacy avoidance, and structured thinking.

## 📊 Leaderboard Results (January 2026)

| Model | Comprehensive Score | Logical | Math | Causal | Analogy | Planning | Quality |
|-------|:------------------:|:-------:|:----:|:------:|:-------:|:--------:|:-------:|
| **Gemini 3 Pro Preview** | **96.08%** | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ |
| **Gemini 3 Flash Preview** | **96.08%** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **DeepSeek V3.2** | **96.08%** | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ |
| **Qwen 3 Next 80B** | **96.08%** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **Claude Haiku 4.5** | **94.12%** | ✅ | ✅ | ✅ | ✅ | ❌ | ✅ |
| Gemini 2.5 Pro | *Pending* | - | - | - | - | - | - |

## 🎯 Benchmark Overview

CORE-Bench is designed to rigorously evaluate the reasoning capabilities of Large Language Models through structured, multi-dimensional testing.

### Reasoning Dimensions

```
┌─────────────────────────────────────────────────────────────────┐
│                        CORE-Bench                               │
├─────────────────┬─────────────────┬─────────────────┬───────────┤
│   🔍 Logical    │   🔢 Math       │   🔗 Causal     │ 🧩 Analogy│
│   Deduction     │   Reasoning     │   Reasoning     │ Reasoning │
│   (15 problems) │   (15 problems) │   (15 problems) │ (6 probs) │
├─────────────────┴─────────────────┴─────────────────┴───────────┤
│                    🗺️ Multi-Step Planning                       │
│                  (River Crossing Puzzle)                        │
├─────────────────────────────────────────────────────────────────┤
│                   ⚖️ Reasoning Quality Judge                     │
│               (Advanced evaluation with criteria)               │
└─────────────────────────────────────────────────────────────────┘
```

### Task Descriptions

| Task | Description | Skills Tested |
|------|-------------|---------------|
| **Logical Deduction** | Syllogisms, modus ponens/tollens, fallacy detection | Formal logic, validity assessment |
| **Math Word Problems** | Multi-step calculations with real-world context | Equation setup, arithmetic, unit handling |
| **Causal Reasoning** | Cause-effect analysis, counterfactuals | Correlation vs causation, confounding |
| **Analogical Reasoning** | Pattern completion (A:B :: C:?) | Relationship identification, abstraction |
| **Multi-Step Planning** | Classic river crossing puzzle | Constraint satisfaction, sequential planning |
| **Quality Evaluation** | Complex scenario analysis | Logical coherence, step clarity, fallacy avoidance |

## 🏗️ Problem Categories

### 1. Logical Deduction (15 problems)
Tests formal reasoning patterns including:
- **Modus Ponens**: If P then Q; P is true → Q is true
- **Modus Tollens**: If P then Q; Q is false → P is false
- **Disjunctive Syllogism**: Either A or B; not A → B
- **Hypothetical Syllogism**: If A then B; If B then C → If A then C
- **Fallacy Detection**: Affirming the consequent, denying the antecedent, existential fallacy

### 2. Mathematical Reasoning (15 problems)
Real-world math scenarios including:
- Percentage calculations and discounts
- Work-rate problems
- Distance/speed/time relationships
- Ratio and proportion
- Mixture problems
- Geometry (area, perimeter)
- Sequence sums

### 3. Causal Reasoning (15 problems)
Tests understanding of causality:
- Causal chain identification
- Controlled experiment interpretation
- Correlation vs causation distinction
- Counterfactual reasoning
- Confounding variable recognition
- Selection bias detection
- Post hoc fallacy identification

### 4. Analogical Reasoning (6 problems)
Pattern-based reasoning:
- Professional : Workplace relationships
- Part : Whole relationships
- Transformation relationships (juvenile → adult)
- Instrument : Measurement relationships

## 📈 Key Insights

### Model Performance Analysis

![Performance Chart](assets/performance_comparison.png)

**Key Findings:**

1. **High Ceiling Performance**: Top models achieve 96%+ accuracy, demonstrating strong reasoning capabilities across domains.

2. **Planning Challenge**: Claude Haiku 4.5 struggled with multi-step planning (river crossing puzzle), highlighting constraint satisfaction as a differentiating task.

3. **Quality Evaluation Gap**: Both Gemini 3 Pro and DeepSeek V3.2 failed the reasoning quality evaluation, which uses stricter judge-based criteria.

4. **Consistent Baseline**: All models passed logical, math, causal, and analogical reasoning tasks, suggesting these categories may need harder problems.

### Strengths & Weaknesses by Category

| Category | Easiest For | Most Challenging For |
|----------|-------------|---------------------|
| Logical Deduction | All models (100%) | N/A |
| Math Reasoning | All models (100%) | N/A |
| Causal Reasoning | All models (100%) | N/A |
| Analogical Reasoning | All models (100%) | N/A |
| Multi-Step Planning | 4/5 models | Claude Haiku 4.5 |
| Quality Evaluation | 3/5 models | Gemini 3 Pro, DeepSeek V3.2 |

## 🚀 Quick Start

### Running the Benchmark Locally

```python
import kaggle_benchmarks as kbench

# Run the comprehensive benchmark
from reasoning_benchmark import comprehensive_reasoning_benchmark

result = comprehensive_reasoning_benchmark.run(
    llm=kbench.llm,
    df=combined_dataset
)

print(f"Accuracy: {result[0]:.2%}")
```

### Evaluating Your Own Model

```bash
# Clone the repository
git clone https://github.com/taiwofeyijimi/core-bench.git
cd core-bench

# Install dependencies
pip install kaggle-benchmarks pandas

# Run evaluation
python evaluate.py --model your_model_name
```

## 📁 Repository Structure

```
core-bench/
├── README.md                      # This file
├── reasoning_benchmark.ipynb      # Main benchmark notebook
├── analysis/
│   ├── core_bench_analysis.ipynb  # Visualization & insights
│   └── leaderboard.json           # Latest leaderboard data
├── assets/
│   ├── performance_comparison.png
│   ├── radar_chart.png
│   ├── task_breakdown.png
│   └── core_bench_banner.png
└── data/
    ├── logic_problems.csv
    ├── math_problems.csv
    ├── causal_problems.csv
    └── analogy_problems.csv
```

## 🔬 Methodology

### Evaluation Criteria

1. **Accuracy**: Correct answer matching (exact or fuzzy)
2. **Reasoning Quality**: Judge LLM evaluation of explanation clarity
3. **Constraint Satisfaction**: Valid solutions for planning tasks

### Scoring

- **Boolean Tasks**: Pass (✅) / Fail (❌)
- **Comprehensive Benchmark**: Accuracy percentage (0-100%)
- **Quality Evaluation**: Criteria-based assessment (6 criteria)

## 📜 Citation

If you use CORE-Bench in your research, please cite:

```bibtex
@misc{core-bench-2026,
  author = {Taiwo Feyijimi},
  title = {CORE-Bench: Comprehensive Ordered Reasoning Evaluation Benchmark},
  year = {2026},
  publisher = {Kaggle Benchmarks},
  url = {https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench}
}
```

## 🤝 Contributing

Contributions are welcome! Areas for improvement:

1. **More Problems**: Add challenging problems to each category
2. **New Categories**: Spatial reasoning, temporal reasoning, etc.
3. **Harder Variants**: Multi-hop reasoning, adversarial examples
4. **Better Metrics**: Fine-grained scoring, partial credit

### Submitting Problems

```python
# Example problem format
new_problem = {
    "premises": "Your premises here",
    "question": "Your question here",
    "answer": "expected_answer",
    "explanation": "Why this is correct"
}
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Kaggle Benchmarks](https://www.kaggle.com/benchmarks) for the evaluation platform
- The AI research community for advancing reasoning capabilities

---

<p align="center">
  <strong>Built with 🧠 for the AI reasoning research community</strong>
</p>

<p align="center">
  <a href="https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench">View on Kaggle</a> •
  <a href="https://github.com/taiwofeyijimi/core-bench/issues">Report Bug</a> •
  <a href="https://github.com/taiwofeyijimi/core-bench/issues">Request Feature</a>
</p>
