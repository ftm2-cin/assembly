main:
    lw x10, a # Carregar 'a' da memória
    lw x11, b # Carregar 'b' da memória
    lw x12, c # Carregar 'c' da memória

    jal x1, multiply # Multiplicar 'a' e 'b'
    sw x12, c # Salvar o resultado em 'c'

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

a: .word 0x0002 # 16-bits
b: .word 0x0003 # 16-bits
c: .word 0x00000000 # 32-bits