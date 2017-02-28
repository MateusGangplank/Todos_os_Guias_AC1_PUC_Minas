// ------------------------- 
// Exemplo0024 - COMPARATOR 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// ------------------------- 
// comparador diferenca
// ------------------------- 


// descrever por portas 

module xorGate (output [5:0] s2,
					 input [5:0] a,
					 input [5:0] b);
assign s2 = (a ^ b);
endmodule // xnorGate

module test_comparator; 
// ------------------------- definir dados 
	reg [5:0] a; 
	reg [5:0] b; 
	wire [5:0] dif; 
	
	xorGate bilara (dif, a, b);

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0024 - Guilherme Terra - 427407"); 
	$display("Test LU's comparador diferenca"); 

// projetar testes do comparador 
	a = 6'b000000; b = 6'b000001;
	$display("\n%b != %b ? %b(1:diferente)", a, b, dif);

end 

endmodule // test_comparator 