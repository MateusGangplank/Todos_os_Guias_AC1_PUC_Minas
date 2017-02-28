// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 

module fullAdder (output s, 
		input a, 
		input b, 
		input carryIn);
		
		 
// descrever por portas 
	a = x;
	b = y;
	carryIn = carry;
	s = soma;

endmodule // fullAdder 

module test_fullAdder; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg carry; 
	wire [3:0] soma; 
// ------------------------- parte principal 

initial begin 
	$display("Exemplo0021 - Marlon Henrique de Azeredo Formiga - 397248"); 
	$display("Test ALU's full adder"); 

//projetar testes do somador complete 
	a = 0001;
	b = 0101;
	carry = 11;
	
	soma = (a + b) + carry;
end 
endmodule // test_fullAdder 