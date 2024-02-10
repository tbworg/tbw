ifndef VERBOSE
MAKEFLAGS += --no-print-directory
endif


ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: arena_build spgame_build

arena_build:
	@cd $(ROOT)/arena/ && make

spgame_build:
	@cd $(ROOT)/spgame/ && make

run:
	@$(ROOT)/spgame/tbwgame