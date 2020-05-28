SHELL := /bin/bash -e

export STACK_NAME=prom
export HOSTNAME=$(hostname)

.PHONY: help

help:	## Help command
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deploy:	## Deploys stack
	docker stack deploy -c docker-stack.yml ${STACK_NAME}

deploy-traefik:	## Deploys traefik stack
	docker stack deploy -c docker-traefik-stack.yml ${STACK_NAME}

teardown: ## Teardown stack
	docker stack rm ${STACK_NAME}
