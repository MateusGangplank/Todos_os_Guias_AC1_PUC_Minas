//------------------------------------------------------
//--- Avaliação 01 - Nome: Jorge Luis dos Santos Leal
//--- Matricula; 417466
//------------------------------------------------------
/*
	  0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
S0 =   0	  1    1    1     0	  0    1    1    0    0    0    1    0    0    0    0	
S1 =	 1	  0    0    0     0	  1    0    0    0    0    1    0    0    0    0    1	
s2 =	 0	  0    0    0     1	  0    0    0    1    1    0    1    1    1    1    0		

  ---f) Montar a equação simplificada do sinal S0 pelo mapa de Veitch-Karnaugh:
  ---- (~ac) + (~a~bd) + (~bcd)

*/
 module saidaS0Mapa(s0,a,b,c,d);
	input a,b,c,d;
	output s0;

   assign s0 = (~a&c)|(~a&~b&d)|(~b&c&d);
 
   endmodule//saida s0

  module Teste;

	reg a,b,c,d;
	wire s0;

	saidaS0Mapa saida (s0,a,b,c,d);

	initial begin
	a=0; b=0; c=0; d=0;
	end

	initial begin

	#1 $display(" Jorge Luis dos Santos Leal ");
	#1 $display("letra f)");
	#1 $display(" a | b | c | d | s0 ");
	$monitor(" %b | %b | %b | %b |  %b ", a,b,c,d,s0);
		   
    #1  a=0; b=0; c=0; d=1;
    #1  a=0; b=0; c=1; d=0; 
    #1  a=0; b=0; c=1; d=1; 
    #1  a=0; b=1; c=0; d=0; 
    #1  a=0; b=1; c=0; d=1; 
    #1  a=0; b=1; c=1; d=0; 
    #1  a=0; b=1; c=1; d=1; 
    #1  a=1; b=0; c=0; d=0; 
    #1  a=1; b=0; c=0; d=1;
    #1  a=1; b=0; c=1; d=0;
    #1  a=1; b=0; c=1; d=1;
    #1  a=1; b=1; c=0; d=0;
    #1  a=1; b=1; c=0; d=1;
    #1  a=1; b=1; c=1; d=0;
    #1  a=1; b=1; c=1; d=1; 

	end	
   endmodule//teste

