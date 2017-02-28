; Somar dois numeros de 8 bits
; Armazenar o primeiro  dado em 001A
; Armazenar o segundo dado em 001B
; Armazenar o resultado         em 001C e 001D (carry)

; Area de codigo      ; Significado     // Comentario
  LXI H,dado1   ; HL <- addr(dado1) // endereco do dado1
  MVI C,00        ; C  <- 0                   // CY = 0
  MOV A,M       ; A  <- MEM [HL]      // A = MEM[dado1]
  INX H             ; HL <- HL+1            // endereco do dado2
  ADD M           ; A  <- A+MEM [HL]  // A = A+MEM[dado2]
  JNC L001       ; if (CY==0), next is L001
  INR C             ; C  <- C+1               // CY = CY+1
L001: NOP
  STA dado3L   ; MEM[dado3L] <- A // MEM[dado3L] = A
  MOV A,C        ; A  <- C                    // A = CY
  STA dado3H  ; MEM[dado3H] <- A // MEM[dado3H] = A
  HLT                ; halt                         // parar
  NOP

; Area de dados
dado1:   @EQU 001A  ; endereço do primeiro  dado
dado2:   @EQU 001B  ; endereço do segundo dado
dado3L: @EQU 001C  ; endereço do resultado
dado3H: @EQU 001D ; endereço do resultado  (carry)
