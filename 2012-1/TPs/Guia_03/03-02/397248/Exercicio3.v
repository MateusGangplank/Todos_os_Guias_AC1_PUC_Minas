// ------------------------- 
// Exercicio3
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248
// -------------------------
  
module andor (output [1:0] s, //--Saida And
	output [1:0] s1, //--Saida Or
	input [1:0] a, 
	input [1:0] b); 
	
//descrever por portas 
	
	and and1(s[0],a[0],b[0]);
	and and2(s[1],a[1],b[1]);

	or or1(s1[0],a[0],b[0]);
	or or2(s1[1],a[1],b[1]);	

endmodule//andor 

module nandnor (output [1:0] s, //--Saida Nand
	output [1:0] s1, //--Saida NOor
	input [1:0] a, 
	input [1:0] b); 
	
// descrever por portas 
	nand and1(s[0],a[0],b[0]);
	nand and2(s[1],a[1],b[1]);

	nor or1(s1[0],a[0],b[0]);
	nor or2(s1[1],a[1],b[1]);	
endmodule // nandnor 

module selecionavel (output [1:0] z, //-- SAIDA AND ou NAND
	output [1:0] z1, //-- SAIDA OR ou NOR
	input [1:0] flag, 
	input [1:0] a, 
	input [1:0] b); 
	
	//-- wires para saidas de AND/OR e NAND/NOR
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
	
//descrever por portas 
	andor andor1(s1,s2,a,b);
	nandnor nandnor1(s3,s4,a,b);
	
	//-- Seleçao	
   //-- temp salva valor do OR que é retornado pela porta andor pois nao vai ser utilizado  
	andor anda(s5,temp,s1,~flag);
	andor ando(s6,temp,s2,~flag);
	andor andna(s7,temp,s3,flag);
	andor andno(s8,temp,s4,flag);
	
	//-- temp salva valor de AND que é retornado pela porta andor pois nao vai ser utilizado 
	andor OR1(temp,z,s5,s7);
	andor OR2(temp,z1,s6,s8);

endmodule//selecionavel

module testmodule; 
// ------------------------- definir dados 
	reg [1:0] x; 
	reg [1:0] y; 
	wire [1:0] z;  //--- saida Z -- AND ou NAND
	wire [1:0] z1;  //--- saida Z1 -- OR ou NOR
	reg [1:0] f;  //--- flag	
	
	// -- chamada do modulo
	selecionavel selec1 (z, z1, f, x, y); 
// ------------------------- parte principal 
initial begin 
	$display("Exercicio3 - Marlon Henrique de Azeredo Formiga - 397248"); 
	$display("Test LU's module"); 
	x = 2'b11; y = 2'b01; f = 2'b00;

//projetar testes do modulo 
	#1 $display("%3b %3b - %3b   %3b  %3b",x,y,z,z1,f);
	f = 2'b11; 
	#1 $display("%3b %3b - %3b   %3b  %3b",x,y,z,z1,f);
	
end 

endmodule//testmodule