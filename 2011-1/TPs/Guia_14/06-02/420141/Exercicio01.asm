;Nome: Raphaela Fernanda Silva
;Matricula: 420141



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
