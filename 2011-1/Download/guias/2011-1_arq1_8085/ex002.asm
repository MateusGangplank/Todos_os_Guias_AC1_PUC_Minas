; Subtrair dois numeros de 8 bits
; Armazenar o primeiro  dado em 000A
; Armazenar o segundo dado em 000B
; Armazenar o resultado         em 000C

; Area de codigo      ; Significado      // Comentario
  LXI H,dado1   ; HL <- addr(dado1) // endereco do dado1
  MOV A,M       ; A  <- MEM [HL]      // A = MEM [dado1]
  INX H             ; HL <- HL+1            // endereco do dado2
  SUB M           ; A  <- A - MEM[HL]  // A = A - MEM [dado2]
  INX H              ; HL <- HL+1           // endereco do dado3
  MOV M,A        ; MEM [HL] <- A      // MEM [dado3] = A
  HLT                ; halt                        // parar

; Area de dados
dado1:  @EQU 000A ; endereço do primeiro  dado
dado2:  @EQU 000B ; endereço do segundo dado
dado3:  @EQU 000C ; endereço do resultado
