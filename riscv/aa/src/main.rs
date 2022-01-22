#![no_std]
#![no_main]
#![feature(global_asm)]

// use core::arch::asm;
use core::arch::global_asm;

mod lang_items;

global_asm!(include_str!("entry.asm"));