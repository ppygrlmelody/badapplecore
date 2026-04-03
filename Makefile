SRC_DIR:= ./mars/src/
BUILD_DIR:= ./mars/build/
WARRIOR_DIR:= ./warriors/

# Delay between frames in microseconds
#DELAY_US:= 25000
DELAY_US:= 10000

all: ${BUILD_DIR}
	cd ${SRC_DIR} && sed -i '70s/[^,]*/ ${DELAY_US}/'2 global.c
	cd ${SRC_DIR} && make && mv pmars ../build

${BUILD_DIR}:
	mkdir ${BUILD_DIR}


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
dwarf:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/dwarf.red
copy:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/copy.red
copy2:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/copy2.red
rave:
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/rave.red
	
debug:
	#-e enter debugger
	#-v 104 enter display mode 4
	${BUILD_DIR}/pmars ${WARRIOR_DIR}/{rave,imp}.red -e -v 104

clean:
	rm -rf ${BUILD_DIR}
	cd ${SRC_DIR} && make clean
