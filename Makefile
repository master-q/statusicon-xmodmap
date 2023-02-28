.PHONY: all clean

all: statusicon-xmodmap

statusicon-xmodmap: statusicon-xmodmap.vala
	valac --pkg=gtk+-3.0 $<

clean:
	rm -f statusicon-xmodmap
