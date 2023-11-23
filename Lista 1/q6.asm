# || PORTAS DO DISPLAY ||
#     a -> 2 | b -> 3
#     c -> 4 | d -> 5
#     e -> 6 | f -> 7
#     g -> 8 | h -> 9

begin:
    jal  x1, input          # Ler entrada digital no teclado
    addi x9, x10, 0         # Copiar valor lido para o registrador x9
zero:
    addi x7, x0, 0
    bne  x9, x7, one        # O valor lido foi igual a 0000?
    addi x5, x0, 0x0000003f # Portas 2 a 7
    addi x6, x0, 0x00000000 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
one:
    addi x7, x0, 1
    bne  x9, x7, two        # O valor lido foi igual a 0001?
    addi x5, x0, 0x00000006 # Portas 2 a 7
    addi x6, x0, 0x00000000 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
two:
    addi x7, x0, 2
    bne  x9, x7, three      # O valor lido foi igual a 0010?
    addi x5, x0, 0x0000001b # Portas 2 a 7
    addi x6, x0, 0x00000001 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
three:
    addi x7, x0, 3
    bne  x9, x7, four       # O valor lido foi igual a 0011?
    addi x5, x0, 0x0000000f # Portas 2 a 7
    addi x6, x0, 0x00000001 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
four:
    addi x7, x0, 4
    bne  x9, x7, five       # O valor lido foi igual a 0100?
    addi x5, x0, 0x00000026 # Portas 2 a 7
    addi x6, x0, 0x00000001 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
five:
    addi x7, x0, 5
    bne  x9, x7, six        # O valor lido foi igual a 0101?
    addi x5, x0, 0x0000002d # Portas 2 a 7
    addi x6, x0, 0x00000001 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
six:
    addi x7, x0, 6
    bne  x9, x7, seven      # O valor lido foi igual a 0110?
    addi x5, x0, 0x0000003d # Portas 2 a 7
    addi x6, x0, 0x00000001 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
seven:
    addi x7, x0, 7
    bne  x9, x7, eight      # O valor lido foi igual a 0111?
    addi x5, x0, 0x00000007 # Portas 2 a 7
    addi x6, x0, 0x00000000 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
eight:
    addi x7, x0, 8
    bne  x9, x7, nine       # O valor lido foi igual a 1000?
    addi x5, x0, 0x0000003f # Portas 2 a 7
    addi x6, x0, 0x00000001 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
nine:
    addi x7, x0, 9
    bne  x9, x7, clear      # O valor lido foi igual a 1001?
    addi x5, x0, 0x0000002f # Portas 2 a 7
    addi x6, x0, 0x00000001 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
clear:
    addi x7, x0, 15
    bne  x9, x7, end        # O valor lido foi igual a 1111?
    addi x5, x0, 0x00000000 # Portas 2 a 7
    addi x6, x0, 0x00000000 # Portas 8 a 13
    sb   x5, 1029(x0)       # Digital Write
    sb   x6, 1027(x0)       # Digital Write
end:
    halt                    # Encerrar o programa
input:
    addi x5, x0, 8          # p = 8
    addi x10, x0, 0         # in = 0
read:
    beq  x5, x0, stop       # p == 0?
    lb   x6, 1025(x0)       # Pegar dígito do buffer
    addi x6, x6, -48        # Converter caractere do dígito para um valor inteiro
    beq  x6, x0, shift      # O dígito lido é igual a 0? Se sim, pular etapa de adição
    add  x10, x10, x5       # in = in + p
shift:
    srli x5, x5, 1          # p >> 1
    jal  x0, read           # Loop
stop:
    jalr x0, 0(x1)          # Return