// ------------------------- 
// Corre��o da prova 
// Nome: Camila Guedes Silveira 
// Matricula: 427393
// ------------------------- 

module questaoC (output s, input a, input b, input c, input d);
	wire c1, c2, c3, c4, c5, c6;
	
	and AND1(c1,~a, ~b, ~c, d);
	and AND2(c2, ~a, ~b, c, d);
	and AND3(c3, ~a, ~b, c, ~d);
	and AND4(c4, ~a, b, c, d);
	and AND5(c5, ~a, b, c, ~d);
	and AND6(c6, a, ~b, c, d);
	
	or OR1(s, c1, c2, c3, c4, c5, c6);
	
endmodule // questaoC

module Teste;

	reg a;
	reg b;
	reg c;
	reg d;
	wire s;

	questaoC Teste (s,a,b,c,d);

	initial begin
		 a=0; b=0; c=0; d=0;
	end

	initial begin

		#1 $display ("Camila Guedes Silveira - 427393 ");
		#1 $display ("Quest�o C");
		#1 $display (" a | b | c | d | s0 ");
		$monitor   (" %b | %b | %b | %b |  %b ", a,b,c,d,s);
		   
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