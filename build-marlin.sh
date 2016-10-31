# /usr/share/arduino/arduino-builder \
#     -compile \
#     -logger=machine \
#     -hardware /usr/share/arduino/hardware \
#     -tools /usr/share/arduino/tools-builder \
#     -built-in-libraries /usr/share/arduino/libraries \
#     -libraries /home/salamandar/Arduino/libraries \
#     -fqbn=archlinux-arduino:avr:mega:cpu=atmega2560 \
#     -ide-version=10612 \
#     -warnings=default \
#     -prefs=build.warn_data_percentage=75 \
#     -prefs=runtime.tools.avr-gcc.path=/usr/share/arduino/hardware/tools/avr \
#     -prefs=runtime.tools.avrdude.path=/usr/share/arduino/hardware/tools/avr \
#     -build-path \
#     /home/salamandar/Triforce-Marlin/build \
#     /home/salamandar/Triforce-Marlin/Marlin/Marlin.ino
#    -verbose \

echo -e "\033[0;31mBuilding done, flashing !\033[0m"

avrdude \
    -C/etc/avrdude.conf \
    -v \
    -patmega2560 \
    -cwiring \
    -P$(ls "/dev/ttyACM"*) \
    -b115200 \
    -D \
    -Uflash:w:/home/salamandar/Triforce-Marlin/build/Marlin.ino.hex:i
