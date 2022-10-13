.PHONY: make_keymap setup_qmk copy_keymap compile_firmware copy_firmware clean

setup_qmk:
	git clone --recurse-submodules https://github.com/qmk/qmk_firmware.git
	cd qmk_firmware
	yes | qmk setup -H .

make_keymap:
	qmk json2c keymap.json -o mine/keymap.c

copy_keymap:
	cp -r mine qmk_firmware/keyboards/keebio/iris/keymaps

compile_firmware:
	qmk compile -kb keebio/iris/rev6b -km mine

copy_firmware:
	cp qmk_firmware/.build/keebio_iris_rev6b_mine.hex .

clean:
	rm -rf qmk_firmware

run: setup_qmk make_keymap copy_keymap compile_firmware copy_firmware clean
