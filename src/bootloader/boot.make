BUILD_DIR=../build
ASM=nasm

.PHONY: all clean

all: stage1

stage1: stage1.bin

stage1.bin: boot.asm
	@$(ASM) $< -f bin -o $@
	@echo "--> Created  stage1.bin"

run:
	qemu-system-i386 -fda stage1.bin

clean:
	@rm -f $(BUILD_DIR)/stage1.bin