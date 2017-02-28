// -------------------------
// Exemplo0023 - COMPARATOR 
// Nome: Silvino Henrique Santos de Souza
// Matricula: 412773
// ------------------------- 

// ------------------------- 
// comparador igualdade
// ------------------------- 


// descrever por portas 

module xnorGate (output [5:0] s2,
					 input [5:0] a,
					 input [5:0] b);
assign s2 = ~(a ^ b);
endmodule // xnorGate

module test_comparator; 
// ------------------------- definir dados 
	reg [5:0] a; 
	reg [5:0] b; 
	wire [5:0] igual; 
	
	xnorGate bilara (igual, a, b);

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0023 - Silvino Henrique Santos de Souza - 412773"); 
	$display("Test LU's comparador igualdade"); 

// projetar testes do comparador 
	a = 6'b000000; b = 6'b000001;
	$display("\n%b = %b ? %b(1: igual)", a, b, igual);

end 

endmodule // test_comparator 