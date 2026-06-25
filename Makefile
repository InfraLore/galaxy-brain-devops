.DEFAULT_GOAL := help

.PHONY: help slides-init slides slides-serve lint pre-commit-install

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

slides-shell: slides-init ## Launch a shell with the slides venv activated
	@VIRTUAL_ENV=.venv PATH=".venv/bin:$(PATH)" $(SHELL)

slides-init: pyproject.toml .venv/bin/pip ## Set up Python venv for slides tooling

.venv/bin/pip:
	python3 -m venv .venv
	.venv/bin/pip install -e .

slides: slides-init ## Build the slide deck
	.venv/bin/mkslides build slides/

slides-serve: slides-init ## Live-preview the slide deck
	.venv/bin/mkslides serve --dev-addr localhost:6767 slides/

pre-commit-install: slides-init ## Install pre-commit hooks
	.venv/bin/pre-commit install

lint: slides-init ## Check for banned phrases and run markdownlint
	@! grep -rni "tribal knowledge" slides/ \
		|| (echo "ERROR: 'tribal knowledge' found -- use 'team lore' instead" && exit 1)
	.venv/bin/pre-commit run --all-files
