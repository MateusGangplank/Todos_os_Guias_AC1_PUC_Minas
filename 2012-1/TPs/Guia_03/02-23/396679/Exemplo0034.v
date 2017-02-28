// ------------------------- 
// Exemplo0034 - XOR XNOR / OR NOR Selecionavel
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679 
// -------------------------

// ------------------------- 
// andor
// ------------------------- 
module andor (
	output [1:0] s, //--Saida And
	output [1:0] s1, //--Saida Or
	input [1:0] a, 
	input [1:0] b); 
	
// descrever por portas 
	and and1(s[0],a[0],b[0]);
	and and2(s[1],a[1],b[1]);

	or or1(s1[0],a[0],b[0]);
	or or2(s1[1],a[1],b[1]);	
endmodule // andor 
 
// ------------------------- 
// xorxnor 
// ------------------------- 
module xorxnor (
	output [1:0] s, //--Saida xor
	output [1:0] s1, //--Saida xnor
	input [1:0] a, 
	input [1:0] b); 
	
// descrever por portas 
	xor xor1(s[0],a[0],b[0]);
	xor xor2(s[1],a[1],b[1]);

	xnor xnor1(s1[0],a[0],b[0]);
	xnor xnor2(s1[1],a[1],b[1]);	
endmodule // xorxnor  

// ------------------------- 
// ornor 
// ------------------------- 
module ornor (
	output [1:0] s, //--Saida or
	output [1:0] s1, //--Saida nor
	input [1:0] a, 
	input [1:0] b); 
	
// descrever por portas 
	or or1(s[0],a[0],b[0]);
	or or2(s[1],a[1],b[1]);

	nor nor1(s1[0],a[0],b[0]);
   nor nor2(s1[1],a[1],b[1]);	
endmodule // ornor  

// ------------------------- 
// selecionavel
// ------------------------- 

module selecionavel (
	output [1:0] z, //-- SAIDA XOR ou OR
	output [1:0] z1, //-- SAIDA XNOR ou NOR
	input [1:0] flag, 
	input [1:0] a, 
	input [1:0] b); 
	//-- wires para saidas de XOR/XNOR e OR/NOR
	wire [1:0] s1;
	wire [1:0] s2;
	wire [1:0] s3;
	wire [1:0] s4;
	//-- wires para saidas de ANDs e OR para seleçao
	wire [1:0] s5; // --- ANDA
	wire [1:0] s6; // --- ANDO
	wire [1:0] s7; // --- ANDNA
	wire [1:0] s8; // --- ANDNO
	//------------------------------------------------
	wire[1:0] temp; //-- variavel temporaria para saida indesejada
	
// descrever por portas 
	xorxnor xorxnor1(s1,s2,a,b);
	ornor ornor1(s3,s4,a,b);
//-- Seleçao	
   //-- temp salva valor do OR que é retornado pela porta andor pois nao vai ser utilizado  
	andor anda (s5,temp,s1,~flag);
	andor ando (s6,temp,s2,~flag);
	andor andna (s7,temp,s3,flag);
	andor andno (s8,temp,s4,flag);
	//-- temp salva valor de AND que é retornado pela porta andor pois nao vai ser utilizado 
	andor OR1 (temp,z,s5,s7);
	andor OR2 (temp,z1,s6,s8);

endmodule // selecionavel




module testmodule; 
// ------------------------- definir dados 
	reg [1:0] x; 
	reg [1:0] y; 
	wire [1:0] z;  //--- saida Z -- XOR ou OR
	wire [1:0] z1;  //--- saida Z1 -- XNOR ou NOR
	reg [1:0] f;  //--- flag	
	
	// -- chamada do modulo
	selecionavel selec1 (z, z1, f, x, y); 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0034 - Bruno Cezar Andrade Viallet - 396679"); 
	$display("Test LU's module"); 
	x = 2'b11; y = 2'b01; f = 2'b00;
// projetar testes do modulo 
	$display(" a   b      XOR   XNOR Flag");
	#1 $display("%3b %3b  - %3b   %3b  %3b",x,y,z,z1,f);
	f = 2'b11; 
	$display(" a   b      OR    NOR  Flag");
	#1 $display("%3b %3b  - %3b   %3b  %3b",x,y,z,z1,f);
	
end 

endmodule // testmodule