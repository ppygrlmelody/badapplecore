MARS_SRC:= ./mars/src/
WARRIORS:= ./warriors/white.red ./warriors/black.red # Order is required

CFLAGS += -O -DEXT94

all: pmars ${WARRIORS}
	./pmars ${WARRIORS}

pmars: ${MARS_SRC}
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
