// -------------------------
//-- Exemplo0032 - OR / AND - 
//-- Nome: Lorena Danielle Gonçalves Bento
//-- Matricula: 435049
// -------------------------

module f4 (output [7:0]s,input [3:0] a, input [3:0] b);
assign s[3:0] = (a & b);
assign s[3:0] = (a | b);
endmodule

module tes_f4;	
	reg [3:0] x;
	reg [3:0] y;
	wire [7:0] s;
	
f4 modulo(s, x, y);
	
	
//--fim definir dados
	
// ------------------------- parte principal
	initial begin
		$display("Exemplo0031 - Lorena Danielle Gonçalves Bento - 435049");
		$display("Test LU's module");
		
		x = 4'b0101; 
		y = 4'b0001;
		#1 $display("\n%3b %3b = %3b", s, x, y);
	end
endmodule // test_exep 01

