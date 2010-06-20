TARGETDIR=$(HOME)
HERE=$(shell pwd)
SRC=$(HERE)/src
BUILD=$(HERE)/build
FILES=.vimrc .bashrc .gitconfig .gitignore
PACKAGES=git+http://github.com/kevinw/pyflakes.git ipython simplejson

all: bash-config python-env

bash-config: $(TARGETDIR)/$(FILES)

$(BUILD):
	@echo Creating build directory...
	@mkdir -p $(BUILD) 

$(TARGETDIR):
	@echo Creating target directory...
	@mkdir -p $(TARGETDIR)

$(TARGETDIR)/$(FILES): $(TARGETDIR)
	@TARGET=$(TARGETDIR)/$(@F); \
	SOURCE=$(SRC)/$(@F); \
	echo Trying to create $$TARGET...; \
	if [ ! -e "$$TARGET" ]; then \
		echo Creating $$TARGET.; \
		ln -s $$SOURCE $$TARGET; \
	else \
		echo $$TARGET already exists.; \
		if [ -h "$$TARGET" ]; then \
			echo $$TARGET is a symlink.; \
			if [ `readlink $$TARGET` != $$SOURCE ]; then \
				echo $$TARGET doesn\'t point to our source file. Renaming it to $$TARGET.orig.; \
				mv $$TARGET $$TARGET.orig; \
				ln -s $$SOURCE $$TARGET; \
			else \
				echo $$TARGET already points to the correct source file.; \
			fi \
		else \
			echo $$TARGET is not a symlink. Renaming it to $$TARGET.orig.; \
			mv $$TARGET $$TARGET.orig; \
			ln -s $$SOURCE $$TARGET; \
		fi \
	fi

python-env: $(TARGETDIR)/bin/python pythonpackages

$(BUILD)/virtualenv.py: | $(BUILD)
	@cd $(BUILD); wget http://bitbucket.org/ianb/virtualenv/raw/8dd7663d9811/virtualenv.py

$(TARGETDIR)/bin/python: $(BUILD)/virtualenv.py
	@python $(BUILD)/virtualenv.py $(TARGETDIR)

pythonpackages: $(TARGETDIR)/bin/python
	@$(TARGETDIR)/bin/pip install $(PACKAGES)

clean:
	rm -rf $(BUILD) 
