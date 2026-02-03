# CORE-Bench Makefile
# Comprehensive Ordered Reasoning Evaluation Benchmark
# https://www.kaggle.com/benchmarks/taiwofeyijimi/core-bench

.PHONY: all setup install clean figures leaderboard test lint help

# Configuration
PYTHON := python
PIP := pip
JUPYTER := jupyter
VENV := .venv
FIGURES_DIR := figures

# Default target
all: setup figures

# -----------------------------------------------------------------------------
# Environment Setup
# -----------------------------------------------------------------------------

setup: $(VENV)/pyvenv.cfg
	@echo "Environment ready"

$(VENV)/pyvenv.cfg:
	$(PYTHON) -m venv $(VENV)
	$(VENV)/Scripts/pip install --upgrade pip
	$(VENV)/Scripts/pip install -r requirements.txt
	@echo "Virtual environment created and dependencies installed"

install:
	$(PIP) install -r requirements.txt

requirements.txt:
	@echo "pandas>=2.0.0" > requirements.txt
	@echo "numpy>=1.24.0" >> requirements.txt
	@echo "matplotlib>=3.7.0" >> requirements.txt
	@echo "seaborn>=0.12.0" >> requirements.txt
	@echo "scipy>=1.10.0" >> requirements.txt
	@echo "scikit-learn>=1.2.0" >> requirements.txt
	@echo "jupyter>=1.0.0" >> requirements.txt
	@echo "nbconvert>=7.0.0" >> requirements.txt
	@echo "kaggle>=1.5.0" >> requirements.txt
	@echo "kaggle-benchmarks>=0.1.0" >> requirements.txt
	@echo "Requirements file generated"

# -----------------------------------------------------------------------------
# Data Management
# -----------------------------------------------------------------------------

leaderboard:
	$(PYTHON) download_leaderboard.py
	@echo "Leaderboard data updated"

validate-data:
	$(PYTHON) -c "import json; data=json.load(open('leaderboard.json')); print(f'Loaded {len(data.get(\"rows\", []))} models')"

# -----------------------------------------------------------------------------
# Figure Generation
# -----------------------------------------------------------------------------

figures: $(FIGURES_DIR)/png/fig1_model_leaderboard.png

$(FIGURES_DIR)/png/fig1_model_leaderboard.png: core_bench_publication_analysis.ipynb leaderboard.json
	$(JUPYTER) nbconvert --execute --to notebook --inplace core_bench_publication_analysis.ipynb
	@echo "All figures generated in $(FIGURES_DIR)/"

figures-html: core_bench_publication_analysis.ipynb
	$(JUPYTER) nbconvert --execute --to html core_bench_publication_analysis.ipynb
	@echo "HTML report generated"

# -----------------------------------------------------------------------------
# Benchmark Execution
# -----------------------------------------------------------------------------

benchmark: reasoning_benchmark.ipynb
	$(JUPYTER) nbconvert --execute --to notebook --inplace reasoning_benchmark.ipynb
	@echo "Benchmark notebook executed"

benchmark-html: reasoning_benchmark.ipynb
	$(JUPYTER) nbconvert --execute --to html reasoning_benchmark.ipynb
	@echo "Benchmark HTML report generated"

# -----------------------------------------------------------------------------
# Quality Assurance
# -----------------------------------------------------------------------------

lint:
	$(PYTHON) -m py_compile download_leaderboard.py
	@echo "Python syntax check passed"

test: validate-data lint
	@echo "All tests passed"

check-figures:
	@echo "Checking figure files..."
	@ls -la $(FIGURES_DIR)/png/*.png 2>/dev/null | wc -l || echo "0 PNG files"
	@ls -la $(FIGURES_DIR)/svg/*.svg 2>/dev/null | wc -l || echo "0 SVG files"
	@ls -la $(FIGURES_DIR)/pdf/*.pdf 2>/dev/null | wc -l || echo "0 PDF files"

# -----------------------------------------------------------------------------
# Cleanup
# -----------------------------------------------------------------------------

clean:
	rm -rf __pycache__ .ipynb_checkpoints
	rm -f *.pyc *.pyo
	@echo "Temporary files cleaned"

clean-all: clean
	rm -rf $(VENV)
	rm -f *.html
	@echo "All generated files cleaned (including virtual environment)"

clean-figures:
	rm -f $(FIGURES_DIR)/png/*.png
	rm -f $(FIGURES_DIR)/svg/*.svg
	rm -f $(FIGURES_DIR)/pdf/*.pdf
	@echo "Figure files cleaned"

# -----------------------------------------------------------------------------
# Development Utilities
# -----------------------------------------------------------------------------

notebook:
	$(JUPYTER) notebook

lab:
	$(JUPYTER) lab

freeze:
	$(PIP) freeze > requirements-lock.txt
	@echo "Dependencies frozen to requirements-lock.txt"

# -----------------------------------------------------------------------------
# Help
# -----------------------------------------------------------------------------

help:
	@echo "CORE-Bench Makefile"
	@echo "==================="
	@echo ""
	@echo "Setup:"
	@echo "  make setup          Create virtual environment and install dependencies"
	@echo "  make install        Install dependencies (without venv)"
	@echo "  make requirements   Generate requirements.txt"
	@echo ""
	@echo "Data:"
	@echo "  make leaderboard    Download latest leaderboard from Kaggle"
	@echo "  make validate-data  Validate leaderboard.json structure"
	@echo ""
	@echo "Execution:"
	@echo "  make figures        Generate all 18 publication figures"
	@echo "  make figures-html   Generate figures with HTML report"
	@echo "  make benchmark      Execute main benchmark notebook"
	@echo "  make benchmark-html Execute benchmark with HTML report"
	@echo ""
	@echo "Quality:"
	@echo "  make lint           Check Python syntax"
	@echo "  make test           Run all validation checks"
	@echo "  make check-figures  List generated figure files"
	@echo ""
	@echo "Cleanup:"
	@echo "  make clean          Remove temporary files"
	@echo "  make clean-all      Remove all generated files including venv"
	@echo "  make clean-figures  Remove generated figures"
	@echo ""
	@echo "Development:"
	@echo "  make notebook       Start Jupyter Notebook server"
	@echo "  make lab            Start JupyterLab server"
	@echo "  make freeze         Lock current dependencies"
	@echo ""
	@echo "Full Reproduction:"
	@echo "  make all            Setup environment and generate figures"
