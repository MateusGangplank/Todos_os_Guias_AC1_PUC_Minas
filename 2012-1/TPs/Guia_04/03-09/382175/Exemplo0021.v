// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// ------------------------- 
// full adder 
// ------------------------- 

module fullAdder (output s0, output carryOut, input a, input b, input carryIn); 
	wire xAB, aAB, aXABC;
	xor (xAB, a, b);
	and (aAB, a, b);
	xor (s0, xAB, carryIn);
	and (aXABC, xAB, carryIn);
	or  (carryOut, aXABC, aAB);
endmodule // fullAdder 

module test_fullAdder; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg [3:0] carry; 
	wire [3:0] soma0; 
	wire [3:0] soma1;
	
	fullAdder somaCompleta (soma0, soma1, x, y, carry);

initial begin:start
	x = 0;
	y = 0;
	carry = 0;
end 	
	
// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Oswaldo Oliveira Paulino - 382175"); 
$display("Test ALU's full adder"); 
$monitor("%b + %b + %b = %b %b", x, y, carry, soma1, soma0);

#1
x = 0; y = 0; carry = 0;
#1
x = 0; y = 0; carry = 1;
#1
x = 0; y = 1; carry = 0;
#1
x = 0; y = 1; carry = 1;
#1
x = 1; y = 0; carry = 0;
#1
x = 1; y = 0; carry = 1;
#1
x = 1; y = 1; carry = 0;
#1
x = 1; y = 1; carry = 1;

end 
endmodule // test_fullAdder 

// ----------------------------- documentacao complementar
/*
    Exemplo0021 - Oswaldo Oliveira Paulino - 382175
    Test ALU's full adder
    0000 + 0000 + 0000 = 0000 0000
    0000 + 0000 + 0001 = 0000 0001
    0000 + 0001 + 0000 = 0000 0001
    0000 + 0001 + 0001 = 0001 0000
    0001 + 0000 + 0000 = 0000 0001
    0001 + 0000 + 0001 = 0001 0000
    0001 + 0001 + 0000 = 0001 0000
    0001 + 0001 + 0001 = 0001 0001
*/