;Nome: Isabella Gon�ales
;Matricula: 420120

; Usando dados com 8 bits. 
; Fa�a: dado04 = dado01 + dado02 - dado03


  LXI H,dado01  
  MOV A,M       
  INX H            
  ADD M 
  INX H
  SUB M        
  STA dado03   
  HLT


; �rea de dados
dado01: @EQU 000C
dado02: @EQU 000D
dado03: @EQU 000E
dado04: @EQU 000F
