#![no_std]
#![no_main]

#[macro_use]
extern crate rpi3_boot;

entry!(kernel_entry);

fn kernel_entry() -> ! {
    loop {}
}
