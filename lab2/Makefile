SDK_PREFIX ?= arm-none-eabi-
CC      := $(SDK_PREFIX)gcc
OBJCOPY := $(SDK_PREFIX)objcopy
QEMU    := qemu-system-gnuarmeclipse

BOARD   ?= STM32F4-Discovery
MCU     ?= STM32F407VG
TARGET  ?= firmware
CPU_CC  ?= cortex-m4
TCP_ADDR?= 1234

deps = \
	start.S \
	lab1.S \
	lscript.ld

.PHONY: all target qemu clean

all: target

target: $(deps)
	$(CC) -x assembler-with-cpp -c -O0 -g3 -mcpu=$(CPU_CC) -mthumb -Wall start.S -o start.o
	$(CC) -x assembler-with-cpp -c -O0 -g3 -mcpu=$(CPU_CC) -mthumb -Wall lab1.S -o lab1.o
	$(CC) start.o lab1.o -mcpu=$(CPU_CC) -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -T./lscript.ld -o $(TARGET).elf
	$(OBJCOPY) -O binary -F elf32-littlearm $(TARGET).elf $(TARGET).bin

qemu: target
	SDL_VIDEODRIVER=x11 SDL_RENDER_DRIVER=software \
	$(QEMU) --verbose --verbose --board $(BOARD) --mcu $(MCU) -d unimp,guest_errors \
	--image $(TARGET).bin --semihosting-config enable=on,target=native \
	-gdb tcp::$(TCP_ADDR) -S

clean:
	-rm -f *.o *.elf *.bin
