target = aarch64-unknown-none

objcopy = cargo objcopy --
objcopy_flags = --strip-all -O binary

all: clean kernel8.img

target/$(target)/debug/kernel8: src/main.rs
	cargo xbuild --target=$(target)
	cp $@ .

kernel8.img: kernel8
	$(objcopy) $(objcopy_flags) $< kernel8.img

run:
	qemu-system-aarch64 -M raspi3 -kernel kernel8.img

