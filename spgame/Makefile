ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ARENA := $(shell dirname $(realpath $(ROOT)))/Arena/
OUTPUT := $(ROOT)/tbwgame.o

CC := clang++
CCFLAGS := -I$(ROOT)/include/ \
	-I$(ARENA)/include/ \
	-c

SOURCES := $(shell find $(ROOT)/game/ -type f -name '*.cpp')

all: build

build: $(OUTPUT)

$(OUTPUT): $(SOURCES)
	$(CC) $(CCFLAGS) $(SOURCES) -o $(OUTPUT)

clean:
	@rm $(OUTPUT)