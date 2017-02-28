// ------------------------- 
// Exemplo0035 - COMPARATOR 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// ------------------------- 
// comparator
// ------------------------- 

// descrever por portas 

module andGate (output s0,
					 input a,
					 input b);
assign s0 = (a & b);
endmodule // andGate

module xnorGate (output s1,
					  input a,
					  input b);
assign s1 = ~(s0 ^ s1);
endmodule // xnorGate

module norGate (output s2,
					  input a);
assign s2 = ~a;
endmodule // norGate

module test_comparator; 
// ------------------------- definir dados 
	reg a; 
	reg b;
	wire s0; 
	wire s1;
	wire s2;
	
	norGate fox (n1, a);
	andGate bilara (s0, n1, b);
	xnorGate bonanza (s1, a, b);
	norGate quebec (n2, b);
	andGate domada (s2, a, n2);

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0035 - Guilherme Terra - 427407"); 
	$display("Test ALU's comparator"); 

	a = 1'b0; b = 1'b0;
	$display("\n%b comparado com %b = %b(<) %b(=) %b(>)", a, b, s0, s1, s2);
	
	a = 1'b0; b = 1'b1;
	$display("\n%b comparado com %b = %b(<) %b(=) %b(>)", a, b, s0, s1, s2);
	
	a = 1'b1; b = 1'b0;
	$display("\n%b comparado com %b = %b(<) %b(=) %b(>)", a, b, s0, s1, s2);

end 

endmodule // test_comparator 