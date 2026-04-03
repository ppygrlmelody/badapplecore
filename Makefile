SRC_DIR:= ./mars/src/
BUILD_DIR:= ./mars/build/
WARRIOR_DIR:= ./warriors/

# Delay between frames in microseconds
DELAY_US:= 100000

all: ${BUILD_DIR}
	cd ${SRC_DIR} && sed -i '70s/[^,]*/ ${DELAY_US}/'2 global.c
	cd ${SRC_DIR} && make && mv pmars ../build
	#${BUILD_DIR}/pmars ${WARRIOR_DIR}/sunset.red

${BUILD_DIR}:
	mkdir ${BUILD_DIR}

debug:
	#-e enter debugger
	#${BUILD_DIR}/pmars ${WARRIOR_DIR}/sunset.red -e

# The following few rules were for re-learning redcode
imp:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/imp.red
useless:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/useless.red
boring:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/boring.red
boring2:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/boring2.red
boring3:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/boring3.red

clean:
	rm -rf ${BUILD_DIR}
	cd ${SRC_DIR} && make clean
