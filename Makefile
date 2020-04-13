.PHONY: all build clean
default: all

all: clean build

build:
	# git clone https://git.suckless.org/st
	makepkg -i

clean:
	rm -rf pkg src st-*
