// ------------------------- 
// Exemplo0035 - NOT, OR, NOR, AND, NAND, XOR, XNOR  Selecionavel
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679 
// -------------------------

// ------------------------- 
// operacoes
// ------------------------- 
module operacoes (
	output [1:0] s, //--Saida Not
	output [1:0] s1, //--Saida Or
	output [1:0] s2, //--Saida Nor
	output [1:0] s3, //--Saida And
	output [1:0] s4, //--Saida Nand
	output [1:0] s5, //--Saida Xor
	output [1:0] s6, //--Saida XNor
	input [1:0] a, 
	input [1:0] b); 
	
// descrever por portas 
	//not not1(s[0],a[0],b[0]);
	//not not2(s[1],a[1],b[1]);

	or or1(s1[0],a[0],b[0]);
	or or2(s1[1],a[1],b[1]);
	
	nor nor1(s2[0],a[0],b[0]);
	nor nor2(s2[1],a[1],b[1]);
	
	and and1(s3[0],a[0],b[0]);
	and and2(s3[1],a[1],b[1]);
	
	nand nand1(s4[0],a[0],b[0]);
	nand nand2(s4[1],a[1],b[1]);
	
	xor xor1(s5[0],a[0],b[0]);
	xor xor2(s5[1],a[1],b[1]);
	
	xnor xnor1(s6[0],a[0],b[0]);
	xnor xnor1(s6[1],a[1],b[1]);	
endmodule // operacoes


module testmodule; 
// ------------------------- definir dados 
	reg [1:0] x; 
	reg [1:0] y; 
	wire [1:0] s; //--Saida Not
	wire [1:0] s1; //--Saida Or
	wire [1:0] s2; //--Saida Nor
	wire [1:0] s3; //--Saida And
	wire [1:0] s4; //--Saida Nand
	wire [1:0] s5; //--Saida Xor
	wire [1:0] s6; //--Saida XNor
	
	// -- chamada do modulo
	operacoes op1 (s, s1, s2, s3, s4, s5, s6, x, y); 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0035 - Bruno Cezar Andrade Viallet - 396679"); 
	$display("Test LU's module"); 
	x = 2'b11; y = 2'b01;
// projetar testes do modulo 
	$display(" a   b      NOT  OR   NOR  AND  NAND XOR  XNOR");
	#1 $display("%3b %3b  - %3b  %3b  %3b  %3b  %3b  %3b  %3b",x,y,s,s1,s2,s3,s4,s5,s6);

	
end 

endmodule // testmodule