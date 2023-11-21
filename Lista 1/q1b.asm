main:
    sw x0, x # x = 0

    lw x5, a # Carregar o valor de 'a'
    lw x6, a # Carregar o valor de 'b'
    lw x7, a # Carregar o valor de 'c'

    check:
        addi x6, x6, 0xffffffb4 # Subtrair 76 de 'b'
        addi x7, x7, 0xffffffe6 # Subtrair 26 de 'c'

        blt x5, x0, skip # a >= 0?
        bge x6, x0, skip # b < 75?
        blt x7, x0, skip # c > 25?

        addi x5, x0, 1
        sw x5, x # x = 1
    skip:

    halt # Encerrar o programa

a: .word 0x00000000 # int a;
b: .word 0x00000000 # int b;
c: .word 0x00000000 # int c;
x: .word 0x00000000 # int x;