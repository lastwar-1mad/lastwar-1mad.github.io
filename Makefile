SHELL := /bin/bash
.DEFAULT_GOAL := help

###########################
# VARIABLES
###########################

###########################
# MAPPINGS
###########################

###########################
# TARGETS
###########################

.PHONY: help
help:  ## help target to show available commands with information
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |  awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: markdownlint
markdownlint: ## Validate markdown files
	docker-compose run docs markdownlint .

.PHONY: shell
shell: ## open dev container with build environment
	docker-compose run --service-ports dev shell

.PHONY: prune
prune: ## delete the whole environment
	docker-compose down -v --rmi all --remove-orphans

.PHONY: serve
serve:  ## start a dev server
	hugo server -p 8080 -s 1kam/
