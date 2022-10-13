# QMK Configuration

A repository to store my QMK configuration. I am using Iris keyboard Rev 6b.

## Install QMK CLI

Install QMK CLI

```
brew tap qmk/qmk
brew install qmk/qmk/qmk
```

## Configure Keymap and Compile

1. Clone the source code

   ```
   git clone --recurse-submodules https://github.com/qmk/qmk_firmware.git
   ```
   
2. Setup qmk

   ```
   cd qmk_firmware
   qmk setup -H .
   ```

   Answer `Y` to everything.

   Verify that it works by running

   ```
   qmk compile -kb keebio/iris/rev6b -km default
   ```

3. Configure Keymap

   Go to [QMK FM](https://config.qmk.fm)

   Choose:
   - Keyboard: keebio/iris/rev6b

   - Keymap Name: whatever

   Download the JSON file

4. Make `keymap.c` file

   ```
   qmk json2c keymap.json -o mine/keymap.c
   ```

5. Move the `mine` to `qmk_firmware/keyboards/keebio/iris/keymaps/mine`

   ```
   cp -r mine qmk_firmware/keyboards/keebio/iris/keymaps
   ```

   Now we can compile our actual keyboard

   ```
   qmk compile -kb keebio/iris/rev6b -km mine
   ```

   This will build the firmware on `qmk_firmware/.build/keebio_iris_rev6b_mine.hex`

## Flash

1. Download QMK Toolbox

   ```
   brew tap homebrew/cask-drivers
   brew install --cask qmk-toolbox
   ```

2. Launch QMK Toolbox

3. Open the `.hex` file that we compiled

4. Flash the left keyboard

   Disconnect the right keyboard, press the reset button and release, a yellow text button will appear on QMK Toolbox, click clear EPPROM, once finished, click Flash.

5. Flash the right keyboard

   Repeat the same on the right keyboard.

## Make

In order to make life easier, there is a `Makefile`. Run `make run` to automate the process of creating firmware. Requires:

- Git v2.13
