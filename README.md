# QMK Configuration

A repository to store my QMK configuration. I am using Iris keyboard Rev 6b.

## Install QMK CLI

Install QMK CLI

```
brew tap qmk/qmk
brew install qmk/qmk/qmk
```

## Configure Keymap and Compile

1. Configure Keymap

   Go to https://config.qmk.fm

   Choose:
   - Keyboard: keebio/iris/rev6b

   - Keymap Name: whatever

   Download the JSON file and the full source code.

2. Make `keymap.c` file

   ```
   qmk json2c keymap.json -o mine/keymap.c
   ```

## Compile

1. Unzip the source code

   ```
   unzip source_code.zip
   ```

   This will unzip it into dir `qmk_firmware`. 

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

   Move the `mine` to `qmk_firmware/keyboards/keebio/iris/keymaps/mine`

   ```
   cp -r mine qmk_firmware/keyboards/keebio/iris/keymaps
   ```

   Now we can compile our actual keyboard

   ```
   qmk compile -kb keebio/iris/rev6b -km mine
   ```

   This will build the firmware on `qmk_firmware/.build/keebio_iris_rev6b_mine`

## Flash

1. Download QMK Toolbox

   ```
   brew tap homebrew/cask-drivers
   brew isntall --cask qmk-toolbox
   ```

2. Launch QMK Toolbox

3. Flash the left keyboard

   Disconnect the right keyboard, press the reset button and release, a yellow text button will appear on QMK Toolbox, click clear EPPROM, once finished, click Flash.

4. Flash the right keyboard

   Repeat the same on the right keyboard.
