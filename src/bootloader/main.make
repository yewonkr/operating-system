
# make -f main.make

ASM=nasm

SRC_DIR=.
BUILD_DIR=.

all: run

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img
            
$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin

run:
	qemu-system-i386 -fda $(BUILD_DIR)/main_floppy.img

