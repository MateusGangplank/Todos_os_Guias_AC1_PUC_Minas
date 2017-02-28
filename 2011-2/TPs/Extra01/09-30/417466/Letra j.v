//------------------------------------------------------
//--- Avaliação 01 - Nome: Jorge Luis dos Santos Leal
//--- Matricula; 417466
//------------------------------------------------------
/*
	  0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
S0 =   0	  1    1    1     0	  0    1    1    0    0    0    1    0    0    0    0	
S1 =	 1	  0    0    0     0	  1    0    0    0    0    1    0    0    0    0    1	
s2 =	 0	  0    0    0     1	  0    0    0    1    1    0    1    1    1    1    0		

  ---j) Montar a descrição por portas do verilog do modulo capaz de calcular S2 pela expressão em d):
  ---

*/
 module saidaS2(s2,a,b,c,d);
	input a,b,c,d;
	output x1,x2,x3,x4,x5,c1,d1,s2;

   not C1(c1,c);
	not D1(d1,d);
	and AND01(x1,a,c1);
	and AND02(x2,b,c1,d1);
	and AND03(x3,a,b,d1);
	or OR01(x4,x1,x2);
	or OR02(s2,x4,x3);
 
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
	#1 $display("letra d)");
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

