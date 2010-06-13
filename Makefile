TARGETDIR=~/testhome
HERE=$(shell pwd)
SRC=$(HERE)/src
BUILD=$(HERE)/build
FILES=.vimrc .bashrc

all: $(TARGETDIR)/$(FILES)

$(BUILD):
	@echo Creating build directory...
	@mkdir -p $(BUILD) 

$(TARGETDIR):
	@echo Creating target directory...
	@mkdir -p $(TARGETDIR)

$(TARGETDIR)/$(FILES): $(TARGETDIR)
	@echo Trying to create $(@F)...; \
	if [ ! -e "$(TARGETDIR)/$(@F)" ]; then \
		echo Creating $(TARGETDIR)/$(@F).; \
		ln -s $(SRC)/$(@F) $(TARGETDIR)/$(@F); \
	else \
		echo $(@F) already exists.; \
	fi


clean:
	rm -rf $(TARGETDIR)
	rm -rf $(BUILD) 
