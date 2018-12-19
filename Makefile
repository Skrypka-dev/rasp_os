TARGET = aarch64-unknown-none

objcopy = cargo objcopy --
objcopy_flags = --strip-all -O binary

all: clean kernel8.img

target/$(TARGET)/debug/kernel8: src/main.rs
	cargo xbuild --target=$(TARGET)
	cp $@ .

target/$(TARGET)/release/kernel8: src/main.rs
	cargo xbuild --target=$(TARGET) --release
	cp $@ .

ifeq ($(DEBUG),1)
kernel8: target/$(TARGET)/debug/kernel8
else
kernel8: target/$(TARGET)/release/kernel8
endif

kernel8.img: kernel8
	$(objcopy) $(objcopy_flags) $< kernel8.img

run:
	qemu-system-aarch64 -M raspi3 -kernel kernel8.img

clean:
	cargo clean

