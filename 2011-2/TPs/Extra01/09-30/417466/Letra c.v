//------------------------------------------------------
//--- Avaliação 01 - Nome: Jorge Luis dos Santos Leal
//--- Matricula; 417466
//------------------------------------------------------
/*
	  0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
S0 =   0	  1    1    1     0	  0    1    1    0    0    0    1    0    0    0    0	
S1 =	 1	  0    0    0     0	  1    0    0    0    0    1    0    0    0    0    1	
s2 =	 0	  0    0    0     1	  0    0    0    1    1    0    1    1    1    1    0		

  ---c) Montar a equação completa do sinal S0 por mintermos:
  ---- ~a~b~cd + ~a~bc~d + ~a~bcd + ~abc~d + ~abcd + a~bcd

*/
 module saidaS0(s0,a,b,c,d);
	input a,b,c,d;
	output s0;
	
	
	and AND1(x1,~a,~b,~c,d);
	and AND2(x2,~a,~b,c,~d);
	and AND3(x3,~a,~b,c,d);
	and AND4(x4,~a,b,c,~d);
	and AND5(x5,~a,b,c,d);
	and AND6(x6,a,~b,c,d);

	or OR1 (s0,x1,x2,x3,x4,x5,x6);
	
   endmodule//saidas s0

  module Teste;

	reg a,b,c,d;
	wire s0;

	saidaS0 saida (s0,a,b,c,d);

	initial begin
	a=0; b=0; c=0; d=0;
	end

	initial begin

	#1 $display(" Jorge Luis dos Santos Leal ");
	#1 $display("letra c)");
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

