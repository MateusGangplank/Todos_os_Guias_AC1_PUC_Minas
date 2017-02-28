// ------------------------- 
// Exemplo0052 – Soma e Subtracao
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  soma e subtracao
// ------------------------- 
module somacompleta (output s, output carryOut, 
                     input  x,  input y,  input carryIn);
										 
	wire  w1;
	wire  w2;
	wire  w3;	
 
// descrever por portas

 xor xor1  (w1,x,y);
 and and1  (w2,x,y);
 xor xor2  (s,w1,carryIn);
 and and2  (w3,w1,carryIn);
 or  or1   (carryOut,w3,w2); 
 
endmodule // somacompleta 

 module somacompleta_chave (output saida, output carryOut,
                            input x, input y, input carryIn, input chave);  

 wire w1;
 
 xor xor1 (w1,y,chave);
 somacompleta soma1 (saida,carryOut,carryIn,x,w1);
 
 endmodule // somacompleta_chave
 
 
 module somacompleta6 (output [5:0] s,output carryOut,
                       input [5:0] x, input [5:0] y, input chave);
 

 wire w1,w2,w3,w4,w5,w6;
 
 
 somacompleta_chave soma1 (s[0],w1,x[0],y[0],chave,chave);
 somacompleta_chave soma2 (s[1],w2,x[1],y[1],w1,chave);
 somacompleta_chave soma3 (s[2],w3,x[2],y[2],w2,chave);
 somacompleta_chave soma4 (s[3],w4,x[3],y[3],w3,chave);
 somacompleta_chave soma5 (s[4],w5,x[4],y[4],w4,chave);
 somacompleta_chave soma6 (s[5],w6,x[5],y[5],w5,chave);
 xor xor1 (carryOut,w6,chave);
 
 endmodule // somacompleta6
 

 module AND_NEGACAO (output s0, 
                     input [5:0] x);
				 
 assign s0 = ~x[0] & ~x[1] & ~x[2] & ~x[3] & ~x[4] & ~x[5];

 endmodule // AND_NEGACAO



 module ZERO__UM (output s0,
                  input[5:0] x);
				
 AND_NEGACAO gate_ZERO__UM (s0,x);

 endmodule //ZERO__UM

 

 module exercicio52;
 
 reg [5:0] x;
 reg [5:0] y;
 reg chave;
 wire carryOut;
 wire sfinal;
 wire [5:0] w;
 
  somacompleta6 soma1 (w,carryOut,x,y,chave);
  ZERO__UM      soma2 (sfinal,w);				
 					
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0051 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Soma & Subtracao");
		$display("");
		$display("LEGENDA: chave=0(soma),chave=1(subtracao);  saida=0(resultado igual a zero), saida=1(resultado diferente de zero)"); 
		$display("");
		
      x=6'b010011;	y=6'b000011; chave=1'b0;	
		#1 $display("x=%b + y=%b = %b   chave=%b carryOut=%b saida=%b",x,y,w,chave,carryOut,sfinal);
		
		x=6'b111111;	y=6'b111111; chave=1'b1;
		#1 $display("x=%b - y=%b = %b   chave=%b carryOut=%b saida=%b",x,y,w,chave,carryOut,sfinal);

 end 
 
endmodule  
 
 