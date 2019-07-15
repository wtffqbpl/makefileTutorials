###########################################################
#
#             MAKEFILE
#
###########################################################

bin_dir   := bin
obj_dir   := obj
target    := $(addprefix $(bin_dir)/, helloDemo)
filelist  := $(wildcard src/*.c)
nodirList := $(notdir $(filelist))
objList   := $(patsubst %.c, $(obj_dir)/%.o, $(nodirList))


c_compile_flags := -g -Wall -c



$(target): $(objList)
# all: $(objList)
	@echo $(filelist)
	@echo $(nodirList)
	@echo $(objList)
	@echo $(target)
	@if test ! -d "$(bin_dir)"; then \
	    mkdir -p $(bin_dir); \
	fi
	$(CC) -o $@ $^


obj/%.o: src/%.c
	@if test ! -d "$(obj_dir)"; then \
	    mkdir -p $(obj_dir); \
	fi
	$(CC) $(c_compile_flags) -o $@ $<

.PHONY: clean
clean:
	rm -rf $(bin_dir) $(obj_dir)

