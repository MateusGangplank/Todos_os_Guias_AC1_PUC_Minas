// ------------------------- 
// Exemplo0022 - SUBTRATOR COMPLETO 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// ------------------------- 
// subtrator completo
// ------------------------- 

module subtrator (output s0, output s1, input a, input b, input c); 
	wire xAB, n0, orNAB, andNAB, andORC;
	xor (xAB, a, b);
	not (n0, a);
	or  (orNAB, n0, b);
	and (andNAB, n0, b);
	xor (s0, xAB, c);
	and (andORC, orNAB, c);
	or  (s1, andORC, andNAB);
endmodule // subtrator

module test_subtrator; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg [3:0] z; 
	wire [3:0] s0; 
	wire [3:0] s1;
	
	subtrator subCompleto (s0, s1, x, y, z);

initial begin:start
	x = 0;
	y = 0;
	z = 0;
end 	
	
// ------------------------- parte principal 
initial begin 
$display("Exemplo0022 - Oswaldo Oliveira Paulino - 382175"); 
$display("Test ALU's subtrator"); 
$monitor("%b - %b - %b = %b %b", x, y, z, s1, s0);

#1
x = 0; y = 0; z = 0;
#1
x = 0; y = 0; z = 1;
#1
x = 0; y = 1; z = 0;
#1
x = 0; y = 1; z = 1;
#1
x = 1; y = 0; z = 0;
#1
x = 1; y = 0; z = 1;
#1
x = 1; y = 1; z = 0;
#1
x = 1; y = 1; z = 1;

end 
endmodule // test_subtrator 

// ----------------------------- documentacao complementar
/*
    Exemplo0022 - Oswaldo Oliveira Paulino - 382175
    Test ALU's subtrator
    0000 - 0000 - 0000 = 0000 0000
    0000 - 0000 - 0001 = 0001 0001
    0000 - 0001 - 0000 = 0001 0001
    0000 - 0001 - 0001 = 0001 0000
    0001 - 0000 - 0000 = 0000 0001
    0001 - 0000 - 0001 = 0000 0000
    0001 - 0001 - 0000 = 0000 0000
    0001 - 0001 - 0001 = 0001 0001
*/