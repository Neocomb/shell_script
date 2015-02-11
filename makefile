CC=gcc
CFLAGS+=-g

src=$(wildcard *.c)
objs=$(patsubst %.c,%.o,$(src))
Target=$(basename $(firstword $(src) ) )

%.o:%.c
	$(CC) -c $< -o $@

$(Target):$(objs)
	$(CC) $(objs) $(CFLAGS) -o $(Target)


.PHONY:test clean
test:
	@echo "Current Dir : " $(shell pwd)
	@echo "Src         : "$(src) 
	@echo "Target      : "$(Target)

clean:
	-rm  $(Target)
	-rm  $(objs)

