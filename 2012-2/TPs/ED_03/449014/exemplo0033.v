// Exemplo0033 - LU and/or/nand/or
// Nome: Átila Martins Silva Júnior
// Matricula: 449014
// -------------------------
// -------------------------
module and_or (output s1, output s2, input a, input b);
	and(s1,a,b);
	or(s2,a,b);
endmodule

module LU_and_or(output s, input a, input b, input chave);
	wire p,q,s1,s2,c1,c2;
	and_or ao(p,q,a,b);
	not (s1,chave);
	buf (s2,chave);
	and(c1,s1,p);
	and(c2,s2,q);
	or(s,c1,c2);
endmodule

module nand_nor (output s1, output s2, input a, input b);
	nand(s1,a,b);
	nor(s2,a,b);
endmodule

module LU_nand_nor(output s, input a, input b, input chave);
	wire p,q,s1,s2,c1,c2;
	nand_nor n(p,q,a,b);
	not (s1,chave);
	buf (s2,chave);
	and(c1,s1,p);
	and(c2,s2,q);
	or(s,c1,c2);
endmodule

module LU_and_or_nand_nor(output s, input a, input b, input chave, input chaveN, input chaveMain);
	wire n1,n2,p1,p2,s1,s2;
	LU_nand_nor LU_N(n1,a,b,chaveN);
	LU_and_or LU_AO(n2,a,b,chave);
	not(p1,chaveMain);
	buf(p2,chaveMain);
	and(s1,n1,p1);
	and(s2,n2,p2);
	or(s,s1,s2);
endmodule

module testLU_and_or_nand_nor;

reg inA, inB, chave, chaveN, chaveP;
wire out;

LU_and_or_nand_nor LUtest (out, inA, inB, chave, chaveN, chaveP);

initial begin
$display("Exemplo0033 - Átila Martins Silva Júnior - 449014");

$display("Test LU's module\n");
$display("Chaveamentos\nand: 0, nand: 0, nand/nor: 0\n");
chaveP = 0; inA = 0; inB = 0; chaveN = 0; chave = 0;
$monitor("ChavePrincipal: %b  a: %b  b: %b  chaveNandNor: %b chaveAndOr: %b   saida: %b",chaveP,inA,inB,chaveN,chave,out);
#1 chaveP = 1; inA = 0; inB = 0; chaveN = 1; chave = 1;
#1 chaveP = 1; inA = 1; inB = 1; chaveN = 0; chave = 0;
#1 chaveP = 0; inA = 1; inB = 1; chaveN = 0; chave = 0;



end
endmodule 
