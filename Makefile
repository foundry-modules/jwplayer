all: modularize-script minify-script create-script-folder copy-files

include ../../build/modules.mk

MODULE = jwplayer
SOURCE_SCRIPT_FOLDER = bin-debug
SOURCE_SCRIPT_FILE_PREFIX =

copy-files:
	cp ${SOURCE_SCRIPT_FOLDER}/jwplayer.flash.swf ${TARGET_SCRIPT_FOLDER}/flash.swf
	cp ${SOURCE_SCRIPT_FOLDER}/jwplayer.html5.js ${TARGET_SCRIPT_FOLDER}/html5.js
	${MODULARIZE} -n "jwplayer/html5" -o "${TARGET_SCRIPT_FOLDER}/html5.raw" ${SOURCE_SCRIPT_FOLDER}/jwplayer.html5.js
	mv ${TARGET_SCRIPT_FOLDER}/html5.raw ${TARGET_SCRIPT_FOLDER}/html5.js
	${UGLIFYJS} ${TARGET_SCRIPT_FOLDER}/html5.js > ${TARGET_SCRIPT_FOLDER}/html5.min.js
	rm -fr ${TARGET_SCRIPT_FOLDER}/html5.raw
