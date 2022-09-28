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
    LFUSE: 3
    HFUSE: 3

    Enter desired LFUSE hex value (ie. 0x62): 37
    Enter desired HFUSE hex value (ie. 0xDF): 79
    Burning fuses...

    Read LFUSE: 3
    Read HFUSE: 3
    Burn complete.

    It is now safe to remove the target AVR.

    Insert target AVR and press button.

The above obviously failed...  

Fuses OK (E:FD, H:DB, L:E2)
