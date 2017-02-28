// ------------------------- 
// Correção da prova 
// Nome: Camila Guedes Silveira 
// Matricula: 427393
// ------------------------- 

module questaoL (output s, input [3:0]x);
	wire c1, c2, c3, c4, c5, c6;
	
	// -- and AND1(c1,~a, ~b, ~c, d);
	and AND2(c2, ~x[0], ~x[1], x[2], x[3]);
	and AND3(c3, ~x[0], ~x[1], x[2], ~x[3]);
	and AND4(c4, ~x[0], x[1], x[2], x[3]);
	and AND5(c5, ~x[0], x[1], x[2], ~x[3]);
	// -- and AND6(c6, a, ~b, c, d);
	
	or OR1(s, c2, c3, c4, c5);
	
endmodule // questaoF

module Teste;

	reg [3:0]x;
	wire s;

	questaoL Teste (s,x);

	initial begin
		 x=4'b0000;
	end

	initial begin

		#1 $display ("Camila Guedes Silveira - 427393 ");
		#1 $display ("Questão L");
		#1 $display (" a | b | c | d | s0 ");
		$monitor   (" %b | %b | %b | %b |  %b ", x[3], x[2], x[1], x[0], s);
		   
    #1  x=4'b0001;
    #1  x=4'b0010; 
    #1  x=4'b0011; 
    #1  x=4'b0100;
    #1  x=4'b0101; 
    #1  x=4'b0110;
    #1  x=4'b0111; 
    #1  x=4'b1000; 
    #1  x=4'b1001;
    #1  x=4'b1010;
    #1  x=4'b1011;
    #1  x=4'b1100;
    #1  x=4'b1101;
    #1  x=4'b1110;
    #1  x=4'b1111; 
   
		


	end	
	endmodule