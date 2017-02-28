//-------------------// -------------------------
// Exemplo0035 - F4
// Nome: guilherme alves
// Matricula: 450161
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output snota,output snotb, output  sor,output snor,output sand,output snand,output sxor,
           output sxnor,output ra,output rb,output ror1,output rnor,output rand,
           output rnand,output rxor,output rxnor,output resp,input a,input b,input[0:2] chave,output [0:2]chaven );
// descrever por portas
not(snota,a);
not(snotb,b);	 
or(sor,a,b);
nor(snor,a,b);
and(sand,a,b);
nand(snand,a,b);
xor(sxor,a,b);
xnor(sxnor,a,b);

not(chaven[0],chave[0]);	
not(chaven[1],chave[1]);	
not(chaven[2],chave[2]);
and(ra,chaven[0],chaven[1],chaven[2],snota);
and(rb,chaven[0],chaven[1],chave[2],snotb);
and(ror1,chaven[0],chave[1],chaven[2],sor);
and(rnor,chaven[0],chave[1],chave[2],snor);
and(rand,chave[0],chaven[1],chaven[2],sand);
and(rnand,chave[0],chaven[1],chave[2],snand);
and(rxor,chave[0],chave[1],chaven[2],sxor);
and(rxnor,chave[0],chave[1],chave[2],sxnor);

or(resp,ra,rb,ror1,rnor,rand,rnand,rxor,rxnor);

endmodule // f4
module test_f4;
// ------------------------- definir dados
reg   x;
reg   y;
reg [0:2]  ch;
wire  za;
wire  zb;
wire zor;
wire znor;
wire zand;
wire znand;
wire zxor;
wire zxnor;
wire wa;
wire wb;
wire wor1;
wire wnor1;
wire wand1;
wire wnand;
wire wxor;
wire wxnor;
wire [0:2]chn;
wire resp;


f4 modulo (za,zb,zor,znor,zand,znand,zxor,zxnor,wa,wb,wor1,wnor1,wand1,wnand,wxor,wxnor,resp,x,y,ch,chn);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0035 - guilherme alves - 450161");
      $display("Test LU's module");
		
      x = 1'b0;      y = 1'b1; ch = 3'b001;
		
 // projetar testes do modulo
#1   $display("%3b %3b ",x,y);
	  $display("chave %2b ",ch);  	
	  $display(resp);
	  $display("",);
   end
endmodule // test_f4