DOCKER_USERNAME := malkomalko
DOCKER_REPOSITORY := elixir-docker

gitsha := $(shell git rev-parse --short HEAD)
gitref := $(shell git symbolic-ref --short -q HEAD || git describe --tags)

ifeq ($(gitref),master)
tag :=
else
tag := :$(gitref)
endif

image := $(DOCKER_USERNAME)/$(DOCKER_REPOSITORY)$(tag)

build: build-$(gitsha)

build-$(gitsha):
	docker build -t $(image) . |tee $@

clean:
	@rm -rf build*
