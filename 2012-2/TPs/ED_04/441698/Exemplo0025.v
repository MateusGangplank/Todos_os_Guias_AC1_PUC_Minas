// -------------------------
// Exemplo0025
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

// -------------------------
// complemento
// -------------------------
module complemento (output[2:0] s,input[2:0] a);
	wire[2:0] s1;
	
	not(s1[0],a[0]);
	not(s1[1],a[1]);
	not(s1[2],a[2]);
	
	assign s = (s1 + 3'b001);
	
endmodule

module test_complemento;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	wire [2:0] resultado;
	
	complemento c2(resultado, x);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0025 - Marcio Enio Gonçalves Dutra Junior - 441698");
		$display("Test");
		
		#1 x = 3'b000;
		
		$monitor ("%b = %b",x,resultado);
		#1 x = 3'b001;
		#1 x = 3'b010;
		#1 x = 3'b011;
		#1 x = 3'b100;
		#1 x = 3'b101;
		#1 x = 3'b110;
		#1 x = 3'b111;
	end
endmodule // test_complemento

