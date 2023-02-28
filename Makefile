PROG = statusicon-xmodmap

.PHONY: all run clean

all: $(PROG)

$(PROG): $(PROG).vala
	valac --pkg=gtk+-3.0 $<

run: all
	./$(PROG)

clean:
	rm -f $(PROG) *.c
