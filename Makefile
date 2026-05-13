MARS_SRC:= ./mars/src/
WARRIORS:= ./warriors/white.red ./warriors/black.red # Order is required

DELAY_US:= 200

all: pmars ${WARRIORS}
	./pmars ${WARRIORS} -s 600

pmars: ${MARS_SRC}
	sed -i '4s/.*/#define BASEDELAY ${DELAY_US}/' ${MARS_SRC}/BASEDELAY.h
	cd ${MARS_SRC} &&\
		make
	mv -v ${MARS_SRC}/pmars .
	sed -i '4s/.*/#define BASEDELAY 0/' ${MARS_SRC}/BASEDELAY.h

${WARRIORS}: ./warriorgen/main.c ./warriorgen/blackin.red ./warriorgen/whitein.red
	cd ./warriorgen/ &&\
		make
	mkdir -p ./warriors/
	cp -v ./warriorgen/blackout.red ./warriors/black.red
	cp -v ./warriorgen/whiteout.red ./warriors/white.red

clean:
	rm -rvf ./pmars warriors
	cd ${MARS_SRC} &&\
		make clean
	cd ./warriorgen/ &&\
		make clean
