TARGETDIR=~/testhome
HERE=$(shell pwd)
BUILD=$(HERE)/build

all: setup

setup:
	@mkdir -p $(TARGETDIR)
	@mkdir -p $(BUILD) 

clean:
	rm -rf $(TARGETDIR)
	rm -rf $(BUILD) 
