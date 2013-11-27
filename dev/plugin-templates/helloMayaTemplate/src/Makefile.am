## Include common compiler and linker flags etc
include ../common.mk

## Define plugin target .so and sources
bin_PROGRAMS = helloMaya.so
helloMaya_so_SOURCES = helloMaya.cpp

## Define installation directories
bindir = $(PLUGIN_DIR)
meldir = $(MEL_DIR)
pythondir = $(PYTHON_DIR)
icondir = $(ICON_DIR)
shelfdir = $(SHELF_DIR)

## Uncomment and modify if you have mel or python scripts, icons and shelves in your project
#mel_DATA = helloMaya.mel
#python_DATA = helloMaya.py
#icon_DATA = helloMaya.png
#shelf_DATA = shelf_helloMaya.mel
