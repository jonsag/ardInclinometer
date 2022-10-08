# ardInclinometer

An inclinometer built around MPU-6050 and ATmega MCUs  

Works on Arduino UNO, not working on barebone MCUs yet.

## Install latest avrdude from git repository

Install prerequisites  
>$ sudo apt install git build-essential cmake libelf-dev libusb-dev libusb-1.0-0-dev libhidapi-dev libftdi-dev libftdi1-dev flex bison  

Download repository  
>$ git clone [https://github.com/avrdudes/avrdude.git](https://github.com/avrdudes/avrdude.git)  

Build  
>$ cd avrdude  
>$ cmake -D CMAKE_BUILD_TYPE=Release -B build_linux  
>$ cmake --build build_linux  

Install (if you have ~/bin in your path)  
>$ cp -r build_linux/src ~/bin/avrdude-bin  
>$ ln -s avrdude-bin/avrdude ~/bin/avrdude  

Check version  
>$ avrdude -?  

    ...
    avrdude version 7.0-20220924 (8f478f0), URL: <https://github.com/avrdudes/avrdude>
