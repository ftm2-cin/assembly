main:
    jal x1, input # Ler do teclado
    addi x10, x14, 0 # Copiar valor lido para 'a'

    jal x1, input # Ler do teclado
    addi x11, x14, 0 # Copiar valor lido para 'b'

    addi x12, x0, 0 # c = 0
    jal x1, multiply # Multiplicar 'a' e 'b'
    jal x1, print # Mostrar resultado

    halt # Encerrar o programa

multiply:
    addi x5, x0, 0 # i = 0
    addi x6, x0, 32 # n = 32
    addi x7, x0, 0x00000001 # Bitmask

    start:
        beq x0, x11, done # b == 0?
        beq x5, x6, done # i == 32?
        
        check:
            and x28, x11, x7 # Least Significant Bit (LSB)
            beq x28, x0, shift # LSB == 0?
            add x12, x12, x10 # c = c + a
        
        shift:
            slli x10, x10, 1 # a << 1
            srli x11, x11, 1 # b >> 1

        addi x5, x5, 1 # i++
        jal x0, start # Loop
    done:
    
    jalr x0, 0(x1) # Return

input:
    addi x5, x0, 0 # i = 0
    addi x6, x0, 4 # n = 4
    addi x14, x0, 0 # in = 0
    addi x28, x0, 32 # stop = ' '

    read:
        beq x5, x6, stop # i == 4?

        lb x7, 1025(x0) # Pegar caractere 'd' do buffer
        beq x7, x0, stop # Verificar se o buffer está vazio
        beq x7, x28, stop # Verificar se há um espaço no buffer

        addi x7, x7, 0xffffffd0 # Converter caractere lido para um inteiro
        slli x14, x14, 1 # in * 2^1
        slli x30, x14, 2 # in * 2^3
        add x14, x30, x14 # in = in * 2^1 + in * 2^3 = in * 10
        add x14, x14, x7 # in = in + d

        addi x5, x5, 1 # i++
        jal x0, read # Loop
    stop:
    
    jalr x0, 0(x1) # Return

print:
    jalr x0, 0(x1) # Return