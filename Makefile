ifndef VERBOSE
MAKEFLAGS += --no-print-directory
endif

RAYVER := 5.0
UPSTREAM := https://github.com/raysan5/raylib/releases/download/$(RAYVER)/raylib-$(RAYVER)_linux_amd64.tar.gz
ARCHIVE := raylib_linux_amd64.tar.gz

ARENALIB := arena.so
GAMEOBJNAME := tbwgame.o
OUTPUTNAME := tbwgame

ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

LD := clang++
LDFLAGS := -L$(ROOT)/Arena/raylib/lib/ \
	-lraylib \
	$(ROOT)/Arena/$(ARENALIB)

GAMEOBJ := $(ROOT)/spgame/$(GAMEOBJNAME)
OUTPUT := $(ROOT)/$(OUTPUTNAME)

.PHONY: $(OUTPUT) link

all: arena_build spgame_build link

arena_build:
	@cd $(ROOT)/Arena/ && make

spgame_build:
	@cd $(ROOT)/spgame/ && make

run:
	export LD_LIBRARY_PATH=$(ROOT)/lib/:$$LD_LIBRARY_PATH && $(OUTPUT)

link: $(OUTPUT)
	@cp $(ROOT)/Arena/raylib/lib/libraylib.so* $(ROOT)/lib/

$(OUTPUT):
	$(LD) $(LDFLAGS) $(GAMEOBJ) -o $(OUTPUT)

deps:
	@rm -r $(ROOT)/Arena/raylib/
	wget -q $(UPSTREAM) -O $(ARCHIVE)
	@if [ ! -f $(ARCHIVE) ]; then \
	    echo "Error: Archive $(ARCHIVE) not found."; \
	    exit 1; \
	fi
	@mkdir -p $(ROOT)/Arena/raylib/
	@tar -xzf $(ARCHIVE) -C $(ROOT)/Arena/raylib/ || { echo "Error extracting archive."; exit 1; }
	@find $(ROOT)/Arena/raylib/ -mindepth 1 -maxdepth 1 -type d -exec sh -c 'mv "$$1"/* "$$1"/.. && rm -r "$$1"' _ {} \;
	@rm $(ARCHIVE)

clean:
	-@cd $(ROOT)/Arena/ && make clean 2> /dev/null
	-@cd $(ROOT)/spgame/ && make clean 2> /dev/null
	-@rm $(OUTPUT) 2> /dev/null