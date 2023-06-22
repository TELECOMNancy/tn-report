CC = typst

ALL = rapport.pdf

all : $(ALL)

rapport.pdf : main.typ
	$(CC) compile $^ $@


clean :
	rm -f $(ALL)

remake : clean all