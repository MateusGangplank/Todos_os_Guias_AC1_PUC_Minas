// ------------------------- 
// Correção da prova 
// Nome: Camila Guedes Silveira 
// Matricula: 427393
// ------------------------- 

module questaoE (output s, input a, input b, input c, input d);
	
	or OR1(c1, a, b, c, ~d);
	or OR2(c2, a, b, ~c, d);
	or OR3(c3, a, b, ~c, ~d);
	or OR4(c4, a, ~b, c, d);
	or OR5(c5, a, ~b, ~c, d);
	or OR6(c6, a, ~b, ~c, ~d);
	or OR7(c7, ~a, b, c, d);
	or OR8(c8, ~a, b, c, ~d);
	or OR9(c9, ~a, b, ~c, ~d);
	or OR10(c10, ~a, ~b, c, d);
	or OR11(c11, ~a, ~b, c, ~d);
	or OR12(c12, ~a, ~b, ~c, d);
	
		
	and AND1(s, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12);
	
endmodule // questaoE

module Teste;

	reg a;
	reg b;
	reg c;
	reg d;
	wire s;

	questaoE Teste (s,a,b,c,d);

	initial begin
		 a=0; b=0; c=0; d=0;
	end

	initial begin

		#1 $display (" Camila Guedes Silveira - 427393 ");
		#1 $display (" a | b | c | d | s1 ");
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