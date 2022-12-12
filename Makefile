.PHONY: make_keymap setup_qmk copy_keymap compile_firmware copy_firmware clean

setup_qmk:
	git clone --recurse-submodules https://github.com/qmk/qmk_firmware.git
	cd qmk_firmware
	yes | qmk setup -H .

clean:
	rm -rf qmk_firmware

make_keymap_iris_rev6b:
	qmk json2c keymap_rev6b_keymap.json -o mine/keymap.c

copy_keymap_iris_rev6b:
	cp -r mine qmk_firmware/keyboards/keebio/iris/keymaps

compile_firmware_iris_rev6b:
	qmk compile -kb keebio/iris/rev6b -km mine

copy_firmware_iris_rev6b:
	cp qmk_firmware/.build/keebio_iris_rev6b_mine.hex .

run_iris_rev6b: setup_qmk make_keymap_iris_rev6b copy_keymap_iris_rev6b compile_firmware_iris_rev6b copy_firmware_iris_rev6b clean

make_keymap_iris_rev7:
	qmk json2c keymap_rev7_keymap.json -o mine/keymap.c

copy_keymap_iris_rev7:
	cp -r mine qmk_firmware/keyboards/keebio/iris/keymaps

compile_firmware_iris_rev7:
	qmk compile -kb keebio/iris/rev7 -km mine

copy_firmware_iris_rev7:
	cp qmk_firmware/.build/keebio_iris_rev7_mine.hex .

run_iris_rev7: setup_qmk make_keymap_iris_rev7 copy_keymap_iris_rev7 compile_firmware_iris_rev7 copy_firmware_iris_rev7 clean
