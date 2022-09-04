CD=cd
CP=cp
LN=ln
MV=mv
MKDIR=mkdir
RM=rm

PROJECT_ROOT_DIR=$(PWD)

EXE=vl_app.elf

SRCS=$(wildcard src/*/*.c)
OBJS=$(SRCS:.c=.o)
IDIR=-I./include
OUT_LIBS_PATH=./out/libs
CFLAGS=
LIBS=-ljson-c
LDFLAGS=-L$(OUT_LIBS_PATH)