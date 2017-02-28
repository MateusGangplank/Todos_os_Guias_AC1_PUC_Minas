;Nome: Anderson Belchior de Carvalho
;Matricula: 396673
;Guia14_03

; expressao aritmetica  usando dados com 8 bits codificados em BCD.
; Fazer: dado04 = dado01 + dado02 - dado03

;Códigos
  LXI H,dado01   ; HL <- addr(dado1)  // endereco do dado1
  MOV A,M       	; A  <- MEM [HL]      // A = MEM [dado1]
  INX H            	; HL <- HL+1            // endereco do dado2
  ADD M 	; A  <- A+MEM [HL]  // A = A+MEM[dado2]
  INX H	; HL <- HL+1            // endereco do dado3
  SUB M        	; A  <- A-MEM [HL]  // A = A-MEM[dado3]
  DAA	;
  STA dado04   	;         	  // resultado dado04
  HLT	; halt                         // parar


;Dados

dado01: @EQU 000A
dado02: @EQU 000B
dado03: @EQU 000C
dado04: @EQU 0010
