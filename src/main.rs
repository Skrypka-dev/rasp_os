#![no_std]
#![no_main]
#![feature(global_asm)]

extern crate panic_abort;

global_asm!(include_str!("boot_cores.S"));
