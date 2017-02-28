// -------------------------
// Exemplo0031 - F4
// Nome: Andre Henriques Fernandes
// Matricula: 427386
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output [3:0] s,
                    input  [3:0] a,
                    input  [3:0] b);
	// descrever por portas
	andgate AND1(s,a,b);
	orgate OR1(s,a,b);

endmodule // f4

module andgate(output [3:0] s,
                    input  [3:0] a,
                    input  [3:0] b);
	assign s = a & b;
endmodule //andgate

module orgate(output [3:0] s,
                    input  [3:0] a,
                    input  [3:0] b);
	assign s = a | b;
endmodule //orgate

module test_f4;
// ------------------------- definir dados
	reg  [3:0] x;
	reg  [3:0] y;
	wire [3:0] z;
	f4 modulo (z, x, y);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0031 - Andre Henriques Fernandes - 427386");
      $display("Test LU's module");
		x = 4'b0011;      y = 4'b0101;
   	// projetar testes do modulo
		#1 $display("%3b %3b %3b",x,y,z);
		
		$monitor("%4b %4b = %4b",x,y,z);
		#1 x = 4'b0011;      y = 4'b0110;
end
endmodule // test_f4