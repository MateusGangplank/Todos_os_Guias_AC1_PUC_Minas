//------------------------------------------------------
//--- Avalia��o 01 - Nome: Jorge Luis dos Santos Leal
//--- Matricula; 417466
//------------------------------------------------------
/*
	  0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
S0 =   0	  1    1    1     0	  0    1    1    0    0    0    1    0    0    0    0	
S1 =	 1	  0    0    0     0	  1    0    0    0    0    1    0    0    0    0    1	
s2 =	 0	  0    0    0     1	  0    0    0    1    1    0    1    1    1    1    0		

  ---a) Montar a equa��o completa do sinal S2 por mintermos:
  ---- ~ab~c~d + a~b~c~d + a~b~cd + ab~c~d + ab~cd + abc~d

*/
 module saidaS2(s2,a,b,c,d);
	input a,b,c,d;
	output s2;
	
	
	and AND1(x1,~a,b,~c,~d);            // DEFINIR PORTA not TAMBEM
	and AND2(x2,a,~b,~c,~d);
	and AND3(x3,a,~b,~c,d);
	and AND4(x4,a,b,~c,~d);
	and AND5(x5,a,b,~c,d);
	and AND6(x6,a,b,c,~d);

	or OR1 (s2,x1,x2,x3,x4,x5,x6);
	
   endmodule//saidas s2

  module Teste;

	reg a,b,c,d;
	wire s2;

	saidaS2 saida (s2,a,b,c,d);

	initial begin
	a=0; b=0; c=0; d=0;
	end

	initial begin

	#1 $display(" Jorge Luis dos Santos Leal ");
	#1 $display("letra a)");
	#1 $display(" a | b | c | d | s2 ");
	$monitor(" %b | %b | %b | %b |  %b ", a,b,c,d,s2);
		   
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

