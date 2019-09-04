TEST_IMAGE=docker.io/lucor/bats

INTERACTIVE:=$(shell [ -t 0 ] && echo 1)

DOCKER_RUN_ARGS:=
ifdef INTERACTIVE
	DOCKER_RUN_ARGS+=-it
endif

.DEFAULT_GOAL=help

help: ## Print help
	@scripts/makefile/make-help.sh Makefile

.PHONY: test
test: ## Run tests
	docker run $(DOCKER_RUN_ARGS) --rm -v $(PWD):/workdir --workdir /workdir $(TEST_IMAGE) bash -c '/workdir/tests/*/*.sh'
