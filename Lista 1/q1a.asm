begin:
    sw    x0, x              # x = 0
    lw    x5, a              # Carregar o valor de 'a'
    lw    x6, b              # Carregar o valor de 'b'
    lw    x7, c              # Carregar o valor de 'c'
    addi  x6, x6, 0xffffffb4 # Subtrair 76 de 'b'
    addi  x7, x7, 0xffffffe6 # Subtrair 26 de 'c'
    blt   x5, x0, end        # a >= 0?
    bge   x6, x0, end        # b < 75?
    blt   x7, x0, end        # c > 25?
    addi  x5, x0, 0x00000001 # x = 1
    sw    x5, x              # Salvar o valor de 'x' na memória
end:
    halt                     # Encerrar o programa
a:
    .word 0x00000000         # Salvar 'a' como variável na memória
b:
    .word 0x00000040         # Salvar 'b' como variável na memória
c:
    .word 0x00000030         # Salvar 'c' como variável na memória
x:
    .word 0x000000ff         # Salvar 'x' como variável na memória