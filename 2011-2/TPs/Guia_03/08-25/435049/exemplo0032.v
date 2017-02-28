// -------------------------
// --Exemplo0032 - OR / AND - 
// --Nome: Lorena Danielle Gonçalves Bento
// --Matricula: 435049
// -------------------------

module f4 (output [3:0] s, input [3:0] a, input [3:0] b, input [3:0] c);
	assign s = ((a & b) & c) | ((c | a) & ~c);
endmodule //f4

module teste_f4;
	
//------definir dados------	
	reg [3:0] x;
	reg [3:0] y;
	reg [3:0] s;
	wire [3:0] r;
	
f4 modulo(r,s,y,x);


// ------------------------- parte principal
	initial begin
		$display("Exemplo0032 - Lorena Danielle Gonçalves Bento - 435049");
		$display("Test LU's module");
		x = 4'b0011; y = 4'b0101; s = 0;
		#1 $display("\n%3b  %3b = %3b",x,y,s);
		
		
		end
endmodule // test_exep 02

//---------------------------------------------------------------
// As saídas são a conjunçao e a disjunção dos bits de entrada, dependendo da //operação
//---------------------------------------------------------------