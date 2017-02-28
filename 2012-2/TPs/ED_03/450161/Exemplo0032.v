//-------------------// -------------------------
// Exemplo0032 - F4
// Nome: guilherme alves de oliveira
// Matricula: 450161
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output  sor,output sand,output ror1,output rand,output resp,input   a,
           input   b,input chave,output chaven);
// descrever por portas
	and and1(s,a,b);
	
	or(sor,a,b);
	and(sand,a,b);
	not(chaven,chave);
	and(rand,sand,chaven);
	and(ror1,sor,chaven);
	or(resp,ror1,rand);
	
	
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg   x;
reg   y;
reg   ch;
wire   chn;
wire  z;
wire  z2;
wire re;
wire e1;
wire e2;


f4 modulo (z,z2,e1,e2,re, x, y,ch,chn);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0032 - guilherme alves de oliveira - 450161");
      $display("Test LU's module");
      x = 1'b0;      y = 1'b1; ch = 1'b1;
 // projetar testes do modulo
#1   $display("a = %1b b = %1b ",x,y);
	  $display("chave = %1b",ch); 	
	  
	  $display("",re);
   end
endmodule // test_f4