Begin:
	addi x18, x0, 0 # Player 1 = 0
	addi x19, x0, 0 # Player 2 = 0
	addi x20, x0, 0x150 # Alpha [0:25] na ram 160
	addi x9, x0, 32 # Flag = 32
	addi x7, x0, 65 # Corrector = 65

# Alocando em Alpha[0:25] = valor
One:
	addi x5, x0, 1
	sw x5, 0(x20)
	sw x5, 16(x20)
	sw x5, 32(x20)
	sw x5, 56(x20)
	sw x5, 80(x20)
Two:
	addi x5, x0, 2
	sw x5, 40(x20)
	sw x5, 68(x20)
	sw x5, 72(x20)
Three:
	addi x5, x0, 3
	sw x5, 12(x20)
	sw x5, 24(x20)
	sw x5, 76(x20)
Four:
	addi x5, x0, 4
	sw x5, 20(x20)
	sw x5, 28(x20)
	sw x5, 84(x20)
	sw x5, 88(x20)
	sw x5, 96(x20)
Five:
	addi x5, x0, 5
	sw x5, 4(x20)
	sw x5, 8(x20)
	sw x5, 48(x20)
	sw x5, 52(x20)
	sw x5, 60(x20)
Six:
	addi x5, x0, 6
	sw x5, 36(x20)
	sw x5, 44(x20)
	sw x5, 92(x20)
Nine:
	addi x5, x0, 9
	sw x5, 64(x20)
	sw x5, 100(x20)

# Lendo as palavras byte a byte 
Read_P1:
	lb x5, 1025(x0) # Byte = 'char' 
	beq x5, x9, Read_P2 # Fim da palavra ?
	sub x5, x5, x7 # Byte = Byte - 65
	slli x6, x5, 2 # Iterator = x t.q. x e [0,4,...,100]
	add x6, x20, x6 # Iterator->Alpha[x6]
	lb x5, 0(x6) # WordValue = Alpha[Iterator]
	add x18, x18, x5 # P1 += x5 
	beq x0, x0, Read_P1 # Volta para Read_P1
Read_P2:
	lb x5, 1025(x0) # Byte = 'char' 
	beq x5, x9, Winner # Fim da palavra ?
	sub x5, x5, x7 # Byte = Byte - 65
	slli x6, x5, 2 # Iterator = x t.q. x e [0,4,...,100]
	add x6, x20, x6 # Iterator->Alpha[Iterator]
	lb x5, 0(x6) # WordValue = Alpha[Iterator]
	add x19, x19, x5 # P2 += x5
	beq x0, x0, Read_P2 # Volta para Read_P2

# Printando o vencedor
Winner:
	blt x18, x19, Winner_P2 # P1 < P2
	beq x18, x19, Tie # P1 = P2 
Winner_P1:
	addi x7, x0, 80 # Reg = P 
	sb x7, 1024(x0) # Print (Reg)
	addi x7, x0, 49 # Reg = 1
	sb x7, 1024(x0) # Print(Reg)
	beq x0, x0, Exit # Fim
Winner_P2:
	addi x7, x0, 80 # Reg = P
	sb x7, 1024(x0) # Print(Reg)
	addi x7, x0, 50 # Reg = 2
	sb x7, 1024(x0) # Print(Reg)
	beq x0, x0, Exit # Fim
Tie:
	addi x7, x0, 84 # Reg = T
	sb x7, 1024(x0) # Print(Reg)
	addi x7, x0, 73 # Reg = I
	sb x7, 1024(x0) # Print(Reg)
	addi x7, x0, 69 # Reg = E
	sb x7, 1024(x0) # Print(Reg)
Exit: 
	halt
# Fim
