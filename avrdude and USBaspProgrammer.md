# avrdude and USBaspProgrammer

## Hardware

### USBaspProgrammer

I'm using [my version](https://github.com/jonsag/usbaspprogrammer) of [Thomas Fischl's programmer](https://www.fischl.de/usbasp/)  

### ATmega board detector

Not necessary, but I find [this](https://github.com/jonsag/ardAVRProgrammer) useful  

### High voltage programmer

I use [this one](https://github.com/jonsag/ardHighVoltageProgrammer)  

## Software

### picocom

>$ picocom -b 115200 /dev/ttyUSB0 --omap crcrlf  

Exit with  
> [Ctrl+a] [Ctrl+x]

### cu

>$ cu -l /dev/ttyUSB0 -s 115200

Exit with
>~.

## Usage

### How to use avrdude

Check  
>$ avrdude -p m328p -c usbasp -v  

Read fuses  
>$ avrdude -p m328p -c usbasp -U lfuse:r:-:i -U hfuse:r:-:i -U efuse:r:-:i -v  

Erase flash  
$ /usr/bin/avrdude -p m328p -c usbasp -t  

    avrdude: AVR device initialized and ready to accept instructions  

    Reading | ################################################## | 100% 0.00s  

>avrdude> erase  

    >>> erase  
    avrdude: erasing chip  
    avrdude>  

or simply
>$ avrdude -p m88p -c usbasp -e  

#### Set fuses

Use [the calculator](https://www.engbedded.com/fusecalc/)  

>$ avrdude -p m328p -c usbasp -U lfuse:w:0xe2:m -U hfuse:w:0xdb:m -U efuse:w:0xfd:m -v

### Programming an ATmega328P  with external clock

Either you hook it up with an oscillator circuit, or you reset the fuses

#### Fuses examples (obtained with the ATmega board detector)

Example output of a programmed 328P with external clock  

    LFuse = 0xF7 
    HFuse = 0xD9 
    EFuse = 0xFC

An unprogrammed 328P with stock fuses

    LFuse = 0xE2 
    HFuse = 0xDB 
    EFuse = 0xFD

#### Use the high voltage programmer

>$ cu -l /dev/ttyUSB0 -s 9600

    Connected.
    Select mode:
    1: ATmega (28-pin)
    2: ATtiny2313
    3: ATtiny (8-pin) / HVSP
    Selected mode: ATMEGA
    Insert target AVR and press button.

    Existing fuse values:
    LFUSE: F7
    HFUSE: D6

    Enter desired LFUSE hex value (ie. 0x62): 62 (enter 0xE2)
    Enter desired HFUSE hex value (ie. 0xDF): 5B (enter 0xDA)
    Burning fuses...

    Read LFUSE: 62
    Read HFUSE: 5B
    Burn complete.

    It is now safe to remove the target AVR.

    Insert target AVR and press button.

Fuses OK (E:FD, H:DA, L:E2)  
Fuses OK (E:FD, H:D6, L:E2)  
Fuses OK (E:FD, H:D6, L:F7)  
