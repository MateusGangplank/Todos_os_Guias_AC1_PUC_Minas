//------------------------- 
// Exercicio2
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248
// -------------------------
  
module f4 (output [1:0] s,
	input [1:0] flag, 
	input [1:0] a, 
	input [1:0] b); 

	wire [1:0]s0; //---Saida AND
	wire [1:0]s1; //---Saida OR
	
	wire [1:0]s2; //---Saida ANDA
	wire [1:0]s3; //---Saida ANDO
	
// descrever por portas 
	and and1(s0[0],a[0],b[0]);
	and and2(s0[1],a[1],b[1]);

	or or1(s1[0],a[0],b[0]);
	or or2(s1[1],a[1],b[1]);
	
//Selecão de Operação
	and ANDA1(s2[0],s0[0],flag[0]);
	and ANDA2(s2[1],s0[1],flag[1]);
	and ANDO(s3[0],s1[0],~flag[0]);
	and ANDO(s3[1],s1[0],~flag[1]);
	or ORF(s[0],s2[0],s3[0]);
	or ORF(s[1],s2[1],s3[1]);		
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
	reg [1:0] x; 
	reg [1:0] y; 
	wire [1:0] z;  //--- saida
	reg [1:0] f;  //--- flag	
	f4 modulo (z, f, x, y); 
// ------------------------- parte principal 
initial begin 
	$display("Exercicio - Marlon Henrique de Azeredo Formiga - 397248"); 
	$display("Test LU's module"); 
	
	x = 2'b11; y = 2'b01; f = 2'b00;
// projetar testes do modulo
	#1 $display("%3b %3b %3b  %3b", x, y, z, f);
	
	f = 2'b11; 
	
	#1 $display("%3b %3b %3b  %3b", x, y, z, f);
	
end 
endmodule // test_f4 