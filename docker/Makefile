#! /usr/bin/make -f


repo:=$(shell echo $$(basename -s .git $$(git config --get remote.origin.url)))
branch:=$(shell echo $$(git rev-parse --abbrev-ref HEAD))

tag=$(git tag --points-at HEAD)

dirs:=grass db
images:=$(patsubst %,local-dev/${repo}-%,${dirs})

INFO:
	echo ${dirs}
	echo ${images}

.PHONY:${images}

images:${images}

${images}:local-dev/${repo}-%:
	export DOCKER_BUILDKIT=1;\
	docker build \
  --build-arg BUILDKIT_INLINE_CACHE=1 \
  -t $@ -t $@:${branch} $*
