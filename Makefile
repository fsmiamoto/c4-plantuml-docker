DOCKER := $(shell which docker)
DOCKER_TAG := c4-plantuml
PLANTUML_FLAGS ?= -tsvg

DIAGRAMS := $(PWD)/diagrams
OUT := out

gen: docker
	$(DOCKER) run --rm  -v $(DIAGRAMS):/src $(DOCKER_TAG):latest $(PLANTUML_FLAGS) ./src/*.puml -o $(OUT)

docker: Dockerfile
	$(DOCKER) build -t $(DOCKER_TAG) .

clean:
	$(RM) $(DIAGRAMS)/$(OUT)/*

.PHONY: gen docker clean
