.DEFAULT_GOAL := help

.PHONY: help slides-init slides slides-serve

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

slides-shell: slides-init ## Launch a shell with the slides venv activated
	@VIRTUAL_ENV=.venv PATH=".venv/bin:$(PATH)" $(SHELL)

slides-init: pyproject.toml ## Set up Python venv for slides tooling
	python3 -m venv .venv
	.venv/bin/pip install -e .

slides: slides-init ## Build the slide deck
	.venv/bin/mkslides build slides/

slides-serve: slides-init ## Live-preview the slide deck
	.venv/bin/mkslides serve --dev-addr localhost:6767 slides/
