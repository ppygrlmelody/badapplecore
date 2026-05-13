MARS_SRC:= ./mars/src/
WARRIORS:= ./warriors/white.red ./warriors/black.red # Order is required

DELAY_US:= 5000

all: pmars ${WARRIORS}
	./pmars ${WARRIORS}

pmars: ${MARS_SRC}
	sed -i '4s/.*/#define BASEDELAY ${DELAY_US}/' ${MARS_SRC}/BASEDELAY.h
	cd ${MARS_SRC} &&\
		make
	mv -v ${MARS_SRC}/pmars .

${WARRIORS}: ./warriorgen/main.c
	cd ./warriorgen/ &&\
		make
	mkdir -p ./warriors/
	cp -v ./warriorgen/genblack.red ./warriors/black.red
	cp -v ./warriorgen/genwhite.red ./warriors/white.red

clean:
	rm -rvf ./pmars warriors
	cd ${MARS_SRC} &&\
		make clean
	cd ./warriorgen/ &&\
		make clean
