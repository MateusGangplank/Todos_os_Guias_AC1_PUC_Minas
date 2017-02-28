// -------------------------
// Exemplo0034 - F4
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4 (output s, output s1,
				input a,
				input b,
				input x);
	
	wire a1;
	wire a2;
	wire o1;
	wire o2;
	wire and1;
	wire or1;
	 
	and AND1 (a1, x, a);
	and AND2 (a2, x, b);
	and AND3 (o1, ~x, a);
	and AND4 (o2, ~x, b);
	xor AND5 (and1, a1, a2);
	or OR1 (or1, o1, o2);
	or OR2 (s, or1, and1);

	assign s1 = ~s;

endmodule // f4

module test_f4;
// ------------------------- definir dados
 reg x;
 reg y;
 reg z;
 wire z0;
 wire z1;
 f4 modulo (z0, z1, x, y, z);

// ------------------------- parte principal

 initial begin
 	 $display("Exemplo0034 - Victor Raphael Machado de Amorim - 420147");
	 $display("Test LU's module");
	
	  x = 1; y = 1; z = 1;
	 
 // projetar testes do modulo
#1 $display("%3b %3b %3b %3b %3b",x,y,z, z0, z1);

 end

endmodule // test_f4