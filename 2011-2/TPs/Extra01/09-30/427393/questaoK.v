// ------------------------- 
// Correção da prova 
// Nome: Camila Guedes Silveira 
// Matricula: 427393
// ------------------------- 

module questaoK (output s, input a, input b, input c, input d);
	// -- wire c1, c2, c3, c4;
	
	assign s1 = ~a | ~b | ~c | ~d;
	assign s2 = ~a | b | ~c | d;
	assign s3 = a | b | c | d;
	assign s4 = a | ~b | c | ~d;
	
	assign s = s1 * s2 * s3 * s4;
	

endmodule // questaoK

module Teste;

	reg a;
	reg b;
	reg c;
	reg d;
	wire s;

	questaoK Teste (s,a,b,c,d);

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