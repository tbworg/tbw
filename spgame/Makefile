ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
OUTPUT := $(ROOT)/tbwgame

CC := clang++
CCFLAGS := -I$(ROOT)/include/

SOURCES := $(shell find $(ROOT)/game/ -type f -name '*.cpp')

all: build

build: $(OUTPUT)

$(OUTPUT): $(SOURCES)
	$(CC) $(CCFLAGS) $(SOURCES) -o $(OUTPUT)