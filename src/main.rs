#![no_std]
#![no_main]
#![feature(asm)]

#[macro_use]
extern crate rpi3_boot;

#[macro_use]
extern crate register;

const MMIO_BASE: u32 = 0x3F00_0000;

mod gpio;
mod uart;

entry!(kernel_entry);

fn kernel_entry() -> ! {
    let uart = uart::MiniUart::new();

    // set up serial console
    uart.init();

    uart.getc(); // Press a key first before being greeted
    uart.puts("Hello Rustacean!\n");

    // echo everything back
    loop {
        uart.send(uart.getc());
    }
}
