mkdir -p build

arduino-builder \
    -compile \
    -logger=machine \
    -hardware /usr/share/arduino/hardware \
    -tools /usr/share/arduino/tools-builder \
    -built-in-libraries /usr/share/arduino/libraries \
    -libraries $HOME/Arduino/libraries \
    -fqbn=archlinux-arduino:avr:mega:cpu=atmega2560 \
    -ide-version=10612 \
    -warnings=default \
    -prefs=build.warn_data_percentage=75 \
    -verbose \
    -build-path $(pwd)/build \
                $(pwd)/Marlin.ino


echo -e "\033[0;31mBuilding done, flashing !\033[0m"

sudo \
avrdude \
    -C/etc/avrdude.conf \
    -v \
    -patmega2560 \
    -cwiring \
    -P$(ls "/dev/ttyACM"*) \
    -b115200 \
    -D \
    -Uflash:w:$(pwd)/build/Marlin.ino.hex:i
