SOURCE_DIR=src
BUILD_DIR=bin

all: main.bin

$(BUILD_DIR)/main.s: $(SOURCE_DIR)/main.c
	cc65 $(SOURCE_DIR)/main.c -t none --cpu 6502 -o $(BUILD_DIR)/main.s

$(BUILD_DIR)/main.o: $(BUILD_DIR)/main.s
	ca65 -t none $(BUILD_DIR)/main.s -o $(BUILD_DIR)/main.o

$(BUILD_DIR)/vectors.o:
	ca65 -t none vectors.s -o $(BUILD_DIR)/vectors.o

$(BUILD_DIR)/:
	mkdir -p $(BUILD_DIR)

main.bin: $(BUILD_DIR)/ $(BUILD_DIR)/main.o $(BUILD_DIR)/vectors.o
	ld65 -C durango.cfg $(BUILD_DIR)/main.o $(BUILD_DIR)/vectors.o -o main.bin

clean:
	rm -Rf $(BUILD_DIR)/ main.bin
