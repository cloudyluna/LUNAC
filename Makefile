CLIENT=OneLife
SERVER=OneLifeServer
OUTPUT_DIR=output
COMPILE_SCRIPTS_DIR=miniOneLifeCompile
OPTIMIZATION=debug
MAKEFILE_VARS=minorGems/game/platforms/SDL/Makefile.common
REVERT_OPTIMIZATION=set-optimization.sh debug

all: client server

set-optimization:
	cd ${COMPILE_SCRIPTS_DIR} && ./set-optimization.sh ${OPTIMIZATION} ../${MAKEFILE_VARS}

client: set-optimization
	cd ${COMPILE_SCRIPTS_DIR} && \
		./compile.sh && \
		./${REVERT_OPTIMIZATION} ../${MAKEFILE_VARS}

run-client:
	cd $(OUTPUT_DIR) && ./${CLIENT}

server: set-optimization
	cd ${COMPILE_SCRIPTS_DIR} && \
		./server.sh && \
		./${REVERT_OPTIMIZATION} ../${MAKEFILE_VARS}

run-server:
	cd ${OUTPUT_DIR} && ./${SERVER}

clean:
	cd $(COMPILE_SCRIPTS_DIR) && ./cleanOldBuildsAndOptionallyCaches.sh

purge:
	rm -rf ${OUTPUT_DIR}
