// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// ------------------------- 
// full adder 
// ------------------------- 


// descrever por portas 

module xorGate (output [2:0] s1,
					 input [5:0] a,
					 input [5:0] b);
assign s1 = (a ^ b);
endmodule // xorGate

module andGate (output [2:0] s2,
					 input [5:0] a,
					 input [5:0] b);
assign s2 = (a & b);
endmodule // andGate

module test_fullAdder; 
// ------------------------- definir dados 
	reg [5:0] a; 
	reg [5:0] b; 
	wire [2:0] soma; 
	wire [2:0] carry;
	xorGate bonanza (soma, a, b);
	andGate danubio (carry, a, b);

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0021 - Guilherme Terra - 427407"); 
	$display("Test ALU's full adder"); 

// projetar testes do somador complete 
	a = 6'b000000; b = 6'b000001;
	$display("\n%b + %b = %b%b", a, b, carry, soma);

end 

endmodule // test_fullAdder 