SOURCE_DIR=src
BUILD_DIR=bin

all: main.bin main16k.bin

$(BUILD_DIR)/main.s: $(SOURCE_DIR)/main.c
	cc65 $(SOURCE_DIR)/main.c -t none --cpu 6502 -o $(BUILD_DIR)/main.s

$(BUILD_DIR)/main.o: $(BUILD_DIR)/main.s
	ca65 -t none $(BUILD_DIR)/main.s -o $(BUILD_DIR)/main.o

$(BUILD_DIR)/vectors.o: vectors.s
	ca65 -t none vectors.s -o $(BUILD_DIR)/vectors.o
	
$(BUILD_DIR)/interrupt.o: interrupt.s
	ca65 -t none interrupt.s -o $(BUILD_DIR)/interrupt.o
	
$(BUILD_DIR)/wait.o: wait.s
	ca65 -t none wait.s -o $(BUILD_DIR)/wait.o
	
$(BUILD_DIR)/dlib.o: dlib.s
	ca65 -t none dlib.s -o $(BUILD_DIR)/dlib.o

$(BUILD_DIR)/crt0.o: crt0.s
	ca65 -t none crt0.s -o $(BUILD_DIR)/crt0.o

$(BUILD_DIR)/sbc.lib: $(BUILD_DIR)/crt0.o
	cp /usr/share/cc65/lib/supervision.lib $(BUILD_DIR)/sbc.lib && ar65 a $(BUILD_DIR)/sbc.lib $(BUILD_DIR)/crt0.o
	

$(BUILD_DIR)/:
	mkdir -p $(BUILD_DIR)

main.bin: $(BUILD_DIR)/ $(BUILD_DIR)/main.o $(BUILD_DIR)/vectors.o $(BUILD_DIR)/interrupt.o $(BUILD_DIR)/wait.o $(BUILD_DIR)/dlib.o $(BUILD_DIR)/crt0.o $(BUILD_DIR)/sbc.lib
	ld65 -C durango.cfg $(BUILD_DIR)/main.o $(BUILD_DIR)/vectors.o $(BUILD_DIR)/interrupt.o $(BUILD_DIR)/wait.o $(BUILD_DIR)/dlib.o $(BUILD_DIR)/crt0.o $(BUILD_DIR)/sbc.lib -o main.bin
	
main16k.bin: $(BUILD_DIR)/ $(BUILD_DIR)/main.o $(BUILD_DIR)/vectors.o $(BUILD_DIR)/interrupt.o $(BUILD_DIR)/wait.o $(BUILD_DIR)/dlib.o $(BUILD_DIR)/crt0.o $(BUILD_DIR)/sbc.lib
	ld65 -C durango16k.cfg $(BUILD_DIR)/main.o $(BUILD_DIR)/vectors.o $(BUILD_DIR)/interrupt.o $(BUILD_DIR)/wait.o $(BUILD_DIR)/dlib.o $(BUILD_DIR)/crt0.o $(BUILD_DIR)/sbc.lib -o main16k.bin	

clean:
	rm -Rf $(BUILD_DIR)/ main.bin
