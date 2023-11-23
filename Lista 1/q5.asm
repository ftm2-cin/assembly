# || PORTAS DOS LEDs ||
#      RL3 | RR5
#      YL6 | YR9
#     GL10 | GR11

init:
    addi x7, x0, 255  # VCC
loop:
    sb   x0, 1030(x0) # Indicar que a leitura será na porta analógica A0
    lh   x5, 1031(x0) # Realizar a leitura do sensor de temperatura do Arduino
t15:
    addi x6, x0, 327
    bge  x5, x6, t20  # Temperatura maior que 15ºC?
    addi x6, x0, 3
    sb   x6, 1033(x0) # RL3
    sb   x7, 1034(x0) # Ligar
    addi x6, x0, 5
    sb   x6, 1033(x0) # RR5
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 6
    sb   x6, 1033(x0) # YL6
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 9
    sb   x6, 1033(x0) # YR9
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 10
    sb   x6, 1033(x0) # GL10
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 11
    sb   x6, 1033(x0) # GR11
    sb   x0, 1034(x0) # Desligar
    jal  x0, loop
t20:
    addi x6, x0, 430
    bge  x5, x6, t25  # Temperatura maior que 20ºC?
    addi x6, x0, 3
    sb   x6, 1033(x0) # RL3
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 5
    sb   x6, 1033(x0) # RR5
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 6
    sb   x6, 1033(x0) # YL6
    sb   x7, 1034(x0) # Ligar
    addi x6, x0, 9
    sb   x6, 1033(x0) # YR9
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 10
    sb   x6, 1033(x0) # GL10
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 11
    sb   x6, 1033(x0) # GR11
    sb   x0, 1034(x0) # Desligar
    jal  x0, loop
t25:
    addi x6, x0, 532
    bge  x5, x6, t30  # Temperatura maior que 25ºC?
    addi x6, x0, 3
    sb   x6, 1033(x0) # RL3
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 5
    sb   x6, 1033(x0) # RR5
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 6
    sb   x6, 1033(x0) # YL6
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 9
    sb   x6, 1033(x0) # YR9
    sb   x7, 1034(x0) # Ligar
    addi x6, x0, 10
    sb   x6, 1033(x0) # GL10
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 11
    sb   x6, 1033(x0) # GR11
    sb   x0, 1034(x0) # Desligar
    jal  x0, loop
t30:
    addi x6, x0, 634
    bge  x5, x6, t35  # Temperatura maior que 30ºC?
    addi x6, x0, 3
    sb   x6, 1033(x0) # RL3
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 5
    sb   x6, 1033(x0) # RR5
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 6
    sb   x6, 1033(x0) # YL6
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 9
    sb   x6, 1033(x0) # YR9
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 10
    sb   x6, 1033(x0) # GL10
    sb   x7, 1034(x0) # Ligar
    addi x6, x0, 11
    sb   x6, 1033(x0) # GR11
    sb   x0, 1034(x0) # Desligar
    jal  x0, loop
t35:
    addi x6, x0, 737
    bge  x5, x6, t    # Temperatura maior que 35ºC?
    addi x6, x0, 3
    sb   x6, 1033(x0) # RL3
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 5
    sb   x6, 1033(x0) # RR5
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 6
    sb   x6, 1033(x0) # YL6
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 9
    sb   x6, 1033(x0) # YR9
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 10
    sb   x6, 1033(x0) # GL10
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 11
    sb   x6, 1033(x0) # GR11
    sb   x7, 1034(x0) # Ligar
    jal  x0, loop
t:
    addi x6, x0, 3
    sb   x6, 1033(x0) # RL3
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 5
    sb   x6, 1033(x0) # RR5
    sb   x7, 1034(x0) # Ligar
    addi x6, x0, 6
    sb   x6, 1033(x0) # YL6
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 9
    sb   x6, 1033(x0) # YR9
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 10
    sb   x6, 1033(x0) # GL10
    sb   x0, 1034(x0) # Desligar
    addi x6, x0, 11
    sb   x6, 1033(x0) # GR11
    sb   x0, 1034(x0) # Desligar
    jal  x0, loop