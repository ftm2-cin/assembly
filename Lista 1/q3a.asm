lw x9, a # Carregar a da memória
lw x18, b # Carregar b da memória
lw x20, c # Carregar c da memória

addi x5, x0, 0 # i = 0
addi x6, x0, 1 # m = 1
addi x7, x0, 32 # n = 32

start:
    beq x5, x7, stop # i == 32?
	and x28, x18, x6 # Bit menos significativo
	beq x28, x0, left # Bit menos significativo é igual a 0?
	
	add x20, x20, x9
    left: slli x9, x9, 1
    right: srli x18, x18, 1

    addi x5, x5, 1 # i++
    beq x0, x0, start
stop:

sw x20, c # Guardar c na memória
halt # Encerrar o programa

a: .word 2 # 16-bits
b: .word 3 # 16-bits
c: .word 0 # 32-bits

# Número máximo de ciclos de clock = 844 