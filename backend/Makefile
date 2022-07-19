##@ Subcommands
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[\/0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Installation
deps/pre: ## Install base setup tools
	python -m pip install -U pip poetry wheel

deps/install:: deps/pre ## Install the dependencies needed for a production installation
	poetry install --no-dev

deps/install-ci:: deps/pre ## Install the dependencies necessary for CI

deps/install-ci::
	poetry install

deps/install-ci::
	poetry run playwright install --with-deps chromium

deps/install-dev:: deps/pre ## Install development dependencies
	poetry install

lint/mypy: ## Run mypy check
	poetry run mypy .

lint/black: ## Run black style check
	poetry run black --check .

lint/isort: ## Run isort import style check
	poetry run isort -c .

lint/flake8: ## Run flake8 check
	poetry run flake8 .

lint: lint/mypy lint/flake8 lint/black lint/isort ## Run all code checks