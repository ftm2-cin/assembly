#FREQUENCIA 100000, TIME 1000
addi x6, x0, 3
addi x7, x0, 4
addi x8, x0, 5
addi x9, x0, 6
addi x10, x0, 7
addi x11, x0, 8
addi x12, x0, 9

addi x13, x0, 1 #1! 
addi x14, x0, 2 #2!
addi x15, x0, 6 #3!
addi x16, x0, 24 #4!
addi x17, x0, 120 #5!
addi x18, x0, 720 #6!
addi x19, x0, 5040 #7!
addi x20, x0, 40320 #8!
addi x21, x0, 362880 #9!
addi x22, x0, 0 #keyboard
addi x23, x0, 0 #contador
addi x24, x0, 0 #auxiliar
addi x25, x0, 13 #enter

addi x26, x0, 10 #10
addi x27, x0, 100 #100
addi x28, x0, 1000 #1000
addi x29, x0, 10000 #10000
addi x30, x0, 100000 #100000
addi x31, x0, 1000000 #1000000

loop:
	lb x22, 1025(x0)
	beq x22, x25, enter
	addi x24, x22, -48
	beq x24, x13, um
	beq x24, x14, dois
	beq x24, x6, tres
	beq x24, x7, quatro
	beq x24, x8, cinco
	beq x24, x9, seis
	beq x24, x10, sete
	beq x24, x11, oito
	beq x24, x12, nove
	jal x1, loop

um:
	add x23, x23, x13
	jal x1, loop

dois:
	add x23, x23, x14
	jal x1, loop

tres:
	add x23, x23, x15
	jal x1, loop

quatro:
	add x23, x23, x16
	jal x1, loop

cinco:
	add x23, x23, x17
	jal x1, loop

seis:
	add x23, x23, x18
	jal x1, loop

sete:
	add x23, x23, x19
	jal x1, loop

oito:
	add x23, x23, x20
	jal x1, loop

nove:
	add x23, x23, x21
	jal x1, loop

#PRINT
enter:
	addi x6, x0, 0
	addi x7, x0, 0
	addi x8, x0, 0
	addi x9, x0, 0
	addi x10, x0, 0
	addi x11, x0, 0
	beq x0, x0, milao

milao:
	blt x23, x31, cent_mi #if cont < 1000000
	sub x23, x23, x31 #x5
	addi x6, x6, 1 #milhao
	jal x1, milao

cent_mi:
	blt x23, x30, dez_mi #if cont < 100000
	sub x23, x23, x30
	addi x7, x7, 1 #centena milhar
	jal x1, cent_mi

dez_mi:
	blt x23, x29, uni_mi #if cont < 10000
	sub x23, x23, x29
	addi x8, x8, 1
	jal x1, dez_mi

uni_mi:
	blt x23, x28, cent #if cont < 1000
	sub x23, x23, x28
	addi x9, x9, 1
	jal x1, uni_mi

cent:
	blt x23, x27, dec #if cont < 100
	sub x23, x23, x27
	addi x10, x10, 1
	jal x1, cent

dec:
	blt x23, x26, print #if cont < 10
	sub x23, x23, x26
	addi x11, x11, 1
	jal x1, dec

print:
	addi x6, x6, 48
	addi x7, x7, 48
	addi x8, x8, 48
	addi x9, x9, 48
	addi x10, x10, 48
	addi x11, x11, 48
	addi x23, x23, 48
	sb x6, 1024(x0) #milhao
	sb x7, 1024(x0) #centena milhar
	sb x8, 1024(x0) #dezena milhar
	sb x9, 1024(x0) #unidade milhar
	sb x10, 1024(x0) #centena 
	sb x11, 1024(x0) #dezena
	sb x23, 1024(x0) #unidade 
halt