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

# search *.c in src directory.
vpath %.c $(src)

# search *.o files in $(obj_dir) directory.
vpath %.o $(obj_dir)

# warning output (process will be continue)
$(warning "output something you want to debug")

# $(error "Output sth, and exit from this line")

# if you want to include some files that will be generated later, 
# you can use '-' before include keyword.
# this means make would ignore imported error.
# -include test.mk


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

