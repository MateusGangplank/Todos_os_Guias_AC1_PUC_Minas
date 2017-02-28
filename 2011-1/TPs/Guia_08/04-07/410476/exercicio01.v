// ---------------------
// 1) a'c'd + a'c + bd + bc
//2) b'c'd' + acd + abd + a'd' + c'd'
//3) a'c'd' + a'b'e + a'ce + ab'c'd + ab'c + acd' + ace

// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// --exercicio01
// ---------------------

  module saidas0(s0,a,b,c,d);
	input a, b,c,d;
	output s0;
	
	
	
	and AND1(temp1,~a,~c,d);
	and AND2(temp3,~a,c);
	and AND3(temp4,b,d);
	and AND4(temp6,b,c);
	or OR1 (s0,temp3,temp4,temp6);

	
   endmodule

    module Teste;

	reg a,b,c,d;
	wire s0;

	saidas0 Teste (s0,a,b,c,d);

	initial begin
		 a=0; b=0; c=0; d=0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | c | d | s0 ");
		$monitor   (" %b | %b | %b | %b |  %b ", a,b,c,d,s0);
		   
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
     endmodule
