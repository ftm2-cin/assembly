begin:
    jal  x1, input            # Ler do teclado
    addi x10, x14, 0x00000000 # Copiar valor lido para 'a'
    jal  x1, input            # Ler do teclado
    addi x11, x14, 0x00000000 # Copiar valor lido para 'b'
    jal  x1, input            # Ler do teclado
    addi x12, x14, 0x00000000 # Copiar valor lido para 'c'
    addi x13, x0, 0x00000000  # x = 0
    addi x11, x11, 0xffffffb4 # Subtrair 76 de 'b'
    addi x12, x12, 0xffffffe6 # Subtrair 26 de 'c'
    blt  x10, x0, end         # a >= 0?
    bge  x11, x0, end         # b < 75?
    blt  x12, x0, end         # c > 25?
    addi x13, x0, 0x00000001  # x = 1
end:
    jal  x1, print            # Mostrar o valor de 'x' no monitor
    halt                      # Encerrar o programa
input:
    addi x5, x0, 0x00000000   # i = 0
    addi x6, x0, 0x0000000a   # n = 10
    addi x14, x0, 0x00000000  # in = 0
    addi x28, x0, 0x00000020  # stop = ' '
read:
    beq  x5, x6, stop         # i == 10?
    lb   x7, 1025(x0)         # Pegar caractere 'd' do buffer
    beq  x7, x0, stop         # Verificar se o buffer está vazio
    beq  x7, x28, stop        # Verificar se há um espaço no buffer
    addi x7, x7, 0xffffffd0   # Converter caractere lido para um inteiro
    slli x14, x14, 1          # in * 2^1
    slli x30, x14, 2          # in * 2^3
    add  x14, x30, x14        # in = in * 2^1 + in * 2^3 = in * 10
    add  x14, x14, x7         # in = in + d
    addi x5, x5, 0x00000001   # i++
    jal  x0, read             # Loop
stop:
    jalr x0, 0(x1)            # Return
print:
    addi x13, x13, 0x00000030 # Converter inteiro para caractere
    sb   x13, 1024(x0)        # Escrever caractere no buffer do monitor
    jalr x0, 0(x1)            # Return