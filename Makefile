include inc.mk

all: clean setup build

run:
	@./out/$(EXE)

setup:
	@$(MKDIR) -p build
	@$(MKDIR) -p out

library:
	@$(MKDIR) -p ./lib/json-c/build
	@$(CD) ./lib/json-c/build && cmake ..
	$(MAKE) -C ./lib/json-c/build
	@$(CD) $(PROJECT_ROOT_DIR)
	@$(MKDIR) -p $(OUT_LIBS_PATH)
	@$(CP) ./lib/json-c/build/libjson-c.so.5.2.0 $(OUT_LIBS_PATH)
	@$(LN) -s libjson-c.so.5.2.0 $(OUT_LIBS_PATH)/libjson-c.so.5
	@$(LN) -s libjson-c.so.5 $(OUT_LIBS_PATH)/libjson-c.so

build:$(OBJS)
	@$(MV) *.o build
	$(CC) -o $(EXE) build/*.o $(CFLAGS) $(LDFLAGS) $(LIBS)
	$(MV) $(EXE) out

clean:
	@$(RM) -rf build
	@$(RM) -rf *.o
	@$(RM) -rf out
	@$(RM) -rf ./lib/json-c/build
	clear

%.o:%.c
	$(CC) $(IDIR) $(CFLAGS) -c $<
