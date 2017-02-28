// ------------------------- 
// Exemplo0023 - Comparador 
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248
// ------------------------- 
// ------------------------- 
// ------------------------- 

module comparador (output s, 
		input a, 
		input b, 
		input carryIn);
		
		 
// descrever por portas 
	a = x;
	b = y;
	carryIn = carry;
	s = soma;

endmodule // comparador 

module test_comparador; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg carry; 
	wire [3:0] soma; 
// ------------------------- parte principal 

initial begin 
	$display("Exemplo0023 - Marlon Henrique de Azeredo Formiga - 397248"); 
	 

//projetar testes do comparador 
	a = 0001;
	b = 0101;
	carry = 11;
	
	soma = (a + b) + carry;
end 
endmodule // 