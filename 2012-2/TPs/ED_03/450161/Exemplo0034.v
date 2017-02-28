//-------------------// -------------------------
// Exemplo0034 - F4
// Nome: guilherme alves de oliveira
// Matricula: 450161
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output  sor,output snor,output sxor,
           output sxnor,output ror1,output rnor,
          output rxor,output rxnor,output resp,input a,input b,input[0:1] chave,output [0:1]chaven );
// descrever por portas
	 
or(sor,a,b);
nor(snor,a,b);
xor(sxor,a,b);
xnor(sxnor,a,b);

not(chaven[0],chave[0]);	
not(chaven[1],chave[1]);	



and(ror1,chaven[0],chaven[1],sor);
and(rnor,chaven[0],chave[1],snor);
and(rxor,chave[0],chaven[1],sxor);
and(rxnor,chave[0],chave[1],sxnor);

or(resp,ror1,rnor,rxor,rxnor);

endmodule // f4
module test_f4;
// ------------------------- definir dados
reg   x;
reg   y;
reg [1:0]  ch;

wire zor;
wire znor;
wire zxor;
wire zxnor;
wire wor1;
wire wnor1;
wire wxor;
wire wxnor;
wire [1:0]chn;
wire resp;


f4 modulo (zor,znor,zxor,zxnor,wor1,wnor1,wxor,wxnor,resp,x,y,ch,chn);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0034 - guilherme alves de oliveira - 450161");
      $display("Test LU's module");
      x = 1'b0;      y = 1'b1; ch = 2'b00;
 // projetar testes do modulo
#1   $display("a = %b b = %b",x,y);
	  $display("chave =  %2b  ",ch);
	  $display("resp = %1b ",resp);
	  $display("",);
   end
endmodule // test_f4