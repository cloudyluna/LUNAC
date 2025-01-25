DEBUGGER=lldb
ONELIFE_DIR=OneLife
MINORGEMS_DIR=minorGems
MINIONELIFECOMPILE_DIR=miniOneLifeCompile
CLIENT=OneLife
SERVER=OneLifeServer
OUTPUT_DIR=output
OPTIMIZATION=debug # debug | debug_no_warn | debug_asan | fast
MAKEFILE_VARS=$(MINORGEMS_DIR)/game/platforms/SDL/Makefile.common
REVERT_OPTIMIZATION=setOptimization.sh debug

all:
	$(MAKE) client OPTIMIZATION=$(OPTIMIZATION)
	$(MAKE) clean OPTIMZATION=$(OPTIMIZATION)
	$(MAKE) server OPTIMIZATION=$(OPTIMIZATION)

set-optimization:
	cd $(MINIONELIFECOMPILE_DIR) && \
		./setOptimization.sh $(OPTIMIZATION) ../$(MAKEFILE_VARS)

client: set-optimization
	cd $(MINIONELIFECOMPILE_DIR) && \
		./compile.sh && \
		./$(REVERT_OPTIMIZATION) ../$(MAKEFILE_VARS)

run-client: client
	cd $(OUTPUT_DIR) && ./$(CLIENT)

debug-client: client
	cd $(OUTPUT_DIR) && $(DEBUGGER) ./$(CLIENT)

server: set-optimization
	cd $(MINIONELIFECOMPILE_DIR) && \
		./server.sh && \
		./$(REVERT_OPTIMIZATION) ../$(MAKEFILE_VARS)

run-server: server
	cd $(OUTPUT_DIR) && ./$(SERVER)

debug-server: server
	cd $(OUTPUT_DIR) && $(DEBUGGER) ./$(SERVER)

format:
	cd ./$(ONELIFE_DIR) && ./format.sh

clean:
	cd $(MINIONELIFECOMPILE_DIR) && \
		./cleanOldBuildsAndOptionallyCaches.sh

purge: clean
	rm -rf $(OUTPUT_DIR)
