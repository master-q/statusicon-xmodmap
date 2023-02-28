.PHONY: all run clean

all: statusicon-xmodmap

statusicon-xmodmap: statusicon-xmodmap.vala
	valac --pkg=gtk+-3.0 $<

run: all
	./statusicon-xmodmap

clean:
	rm -f statusicon-xmodmap *.c
