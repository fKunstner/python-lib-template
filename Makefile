.PHONY: help
.PHONY: install install-dev
.PHONY: test
.PHONY: format format-check
.PHONY: docs

.DEFAULT: help
help:
	@echo "install        Install the library and dependencies"
	@echo "install-dev    Install in editable mode with dev. dependencies"
	@echo "test           Run pytest"
	@echo "format         Run formatting tools"
	@echo "lint           Run linters and formatting tools (no edits)"
	@echo "docs           Build the docs"

test:
	@pytest -vx .

# Linter and autoformatter
# Uses black.toml config instead of pyproject.toml to avoid pip issues. See
# - https://github.com/psf/black/issues/683
# - https://github.com/pypa/pip/pull/6370
# - https://pip.pypa.io/en/stable/reference/pip/#pep-517-and-518-support
format:
	@echo "Black"
	@black . --config=black.toml
	@echo "Isort"
	@isort --apply
	@make format-check

lint:
	@echo "Black"
	@black . --config=black.toml --check
	@echo "Isort"
	@isort --check
	@echo "Flake8"
	@flake8 .
	@echo "PyDocStyle"
	@pydocstyle --count .
	@echo "Darglint"
	@darglint --verbosity 2 .

install:
	@pip install -r requirements.txt
	@pip install .

install-dev:
	@echo "Install dev tools..."
	@pip install -r requirements-dev.txt
	@echo "Install dependencies..."
	@pip install -r requirements.txt
	@echo "Install library in editable mode..."
	@pip install -e .
	@echo "Install pre-commit hooks..."
	@pre-commit install

docs:
	@cd docs_src && make html
