OUTPUT_ARCH(riscv)
ENTRY(_start)
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    . = BASE_ADDRESS;

    .text : {
        *(.text.entry)
        *(.text .text.*)
    }

    .data : {
        *(.data .data.*)
    }

    /DISCARD/ : {
        *(.eh_frame)
    }
}