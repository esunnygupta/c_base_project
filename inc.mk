CP=cp
MV=mv
MKDIR=mkdir
RM=rm
EXE=vl_app.elf

SRCS=$(wildcard src/*/*.c)
OBJS=$(SRCS:.c=.o)
IDIR=-I./include
CFLAGS=