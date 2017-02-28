;Bruno César Lopes Silva - 415985
;Guia 14 Exe01


LXI H,d01  
  MOV A,M       
  INX H            
  ADD M 
  INX H
  SUB M        
  STA dado03   
  HLT


;DADOS
d01: @EQU 000C
d02: @EQU 000D
d03: @EQU 000E
d04: @EQU 000F
