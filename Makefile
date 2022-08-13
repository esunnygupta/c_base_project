include inc.mk

all: clean setup build

run:
	@./out/$(EXE)

setup:
	@$(MKDIR) -p build
	@$(MKDIR) -p out

build:$(OBJS)
	@$(MV) *.o build
	$(CC) -o $(EXE) build/*.o $(CFLAGS) $(LDFLAGS) $(LIBS)
	$(MV) $(EXE) out

clean:
	@$(RM) -rf build
	@$(RM) -rf *.o
	@$(RM) -rf out
	clear

%.o:%.c
	$(CC) $(IDIR) $(CFLAGS) -c $<
