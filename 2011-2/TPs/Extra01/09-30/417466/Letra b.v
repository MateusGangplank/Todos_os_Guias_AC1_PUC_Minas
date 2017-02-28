//------------------------------------------------------
//--- Avaliação 01 - Nome: Jorge Luis dos Santos Leal
//--- Matricula; 417466
//------------------------------------------------------
/*
	  0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
S0 =   0	  1    1    1     0	  0    1    1    0    0    0    1    0    0    0    0	
S1 =	 1	  0    0    0     0	  1    0    0    0    0    1    0    0    0    0    1	
s2 =	 0	  0    0    0     1	  0    0    0    1    1    0    1    1    1    1    0		

  ---b) Montar a equação compacta do sinal S1 por MAXtermos:

*/
 module saidaS1(s1,a,b,c,d);
	input a,b,c,d;
	output s1;
	
	
	or OR1(x1,a,b,c,~d);
	or OR2(x2,a,b,~c,d);
	or OR3(x3,a,b,~c,~d);
	or OR4(x4,a,~b,c,d);
	or OR5(x5,a,~b,~c,d);
	or OR6(x6,a,~b,~c,~d);
	or OR7(x7,~a,b,c,d);
	or OR8(x8,~a,b,c,~d);
	or OR9(x9,~a,b,~c,~d);
	or OR10(x10,~a,~b,c,d);
	or OR11(x11,~a,~b,c,~d);
	or OR12(x12,~a,~b,~c,d);

	and AND1 (s1,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12);
	
   endmodule//saidas s1

  module Teste;

	reg a,b,c,d;
	wire s1;

	saidaS1 saida (s1,a,b,c,d);

	initial begin
	a=0; b=0; c=0; d=0;
	end

	initial begin

	#1 $display(" Jorge Luis dos Santos Leal ");
	#1 $display("letra b)");
	#1 $display(" a | b | c | d | s1 ");
	$monitor(" %b | %b | %b | %b |  %b ", a,b,c,d,s1);
		   
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