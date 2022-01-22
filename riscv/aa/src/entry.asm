    .section .text.entry
    .globl _start
_start:
    # 加载helloworld地址到a1,编译器会优化为auipc
    la a1, helloworld
    # t1 = 13
    li t1, 13
1:
    # a0 = a1[0], 为sbi接口第一个参数
    lb a0, 0(a1)
    # a7 = 1， 1为sbi码，对应SBI_CONSOLE_PUTCHAR, 打印字符
    addi a7, x0, 1
    # 调用sbi
    ecall

    # a1++
    addi a1, a1, 1
    # t1--
    addi t1, t1, -1
    # if t1 != 0, 往后跳到1标签执行
    bne t1, x0, 1b

2:
    beq x0, x0, 2b

    .data
helloworld:  
    .ascii "Hello Risc-V!"

