// ------------------------- 
// Exemplo0017 - BASE 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module byt_inv2 (output [7:0] s, input [7:0] e);
	assign s = ~e + 1;
endmodule // byt inverter 2
// -- modulo principal
module test_base_07; 
// ------------------------- definir dados 
reg [7:0] a;
wire [7:0] ai; 
byt_inv2 COMP1 (ai, a);
// ------------------------- parte principal 
initial begin:start
a = 8'b1001101;
end 

initial begin
	$display("Exercicio0017 - Jose Ferreira Reis Fonseca - 405808"); 
	$display("Test byte inverter 2's complement"); 
	$display("\n2's Complements");
	$monitor("a = %8b = %8b", a, ai); 
	a = 8'b1001101;
	#1;
	a = 8'b1011111;
	#1;
	a = 8'b1100001;
	#1;
	a = 8'b1100111;
	#1;
	a = 8'b0001000;
end 
endmodule // test_byte_inv 2