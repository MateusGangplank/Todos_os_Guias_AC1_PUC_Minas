//-------------------// -------------------------
// Exemplo0033 - F4
// Nome: guilherme alves de oliveira
// Matricula: 450161
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output  sand,output sor,output  snand,output snor,output rand,output ror1,output rnand,output rnor,output resp,output resp1,
                 input   a,
                 input   b,input chave,output chaven);
// descrever por portas
	and(sand,a,b);
	or (sor,a,b);
	nand(snand,a,b);
	nor (snor,a,b);
	not(chaven,chave);
	
	
	and(rand,sand,chaven);
	
	and(ror1,sor,chaven);
	and(rnand,snand,chave);
	and(rnor,snor,chave);
	or(resp,rand,rnand);
	or(resp1,ror1,rnor);
	
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg   x;
reg   y;
reg   ch;
wire chn;
wire  z;
wire  z2;
wire  z3;
wire  z4;
wire re;
wire res;
wire e1;
wire e2;
wire e3;
wire e4;


f4 modulo (z,z2,z3,z4,e1,e2,e3,e4,res,re, x, y,ch,chn);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0033 - guilherme alves - 450161");
      $display("Test LU's module");
      x = 1'b1;      y = 1'b1; ch =0;
		
		
 // projetar testes do modulo
#1   $display("a = %b b = %b ",x,y);
	  $display("chave ",ch);
	  $display("and/nand = %2b or/nor = %2b",res,re);
   end
endmodule // test_f4