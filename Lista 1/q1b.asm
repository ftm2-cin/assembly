L0:
    lw x5, a # Carregar o valor de a
    lw x6, b # Carregar o valor de b
    lw x7, c # Carregar o valor de c 

    sw x0, x # x = 0;
L1:
    addi x6, x6, 0xffffffb4 # b = b - 76
    addi x7, x7, 0xffffffe6 # c = c - 26

    blt x5, x0, L3 # a >= 0?
    bge x6, x0, L3 # b <= 75?
    blt x7, x0, L3 # c > 25?
L2:
    addi x5, x0, 1
    sw x5, x # x = 1;
L3:
    halt

a: .word 0x00000000 # int a;
b: .word 0x00000000 # int b;
c: .word 0x00000000 # int c;
x: .word 0x00000000 # int x;