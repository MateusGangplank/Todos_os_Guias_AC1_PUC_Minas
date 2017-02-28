// ------------------------- 
// Exemplo0051 – Soma e Subtracao
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
 
 
 module somacompleta6;
 
 reg [5:0] x;
 reg [5:0] y;
 reg chave; //carryIn
 wire s0,s1,s2,s3,s4,s5,w1,w2,w3,w4,w5,w6,carryOut;
 
 
 somacompleta_chave soma1 (s0,w1,x[0],y[0],chave,chave);
 somacompleta_chave soma2 (s1,w2,x[1],y[1],w1,chave);
 somacompleta_chave soma3 (s2,w3,x[2],y[2],w2,chave);
 somacompleta_chave soma4 (s3,w4,x[3],y[3],w3,chave);
 somacompleta_chave soma5 (s4,w5,x[4],y[4],w4,chave);
 somacompleta_chave soma6 (s5,w6,x[5],y[5],w5,chave);
 xor xor1 (carryOut,w6,chave);
 

 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0051 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Soma & Subtracao"); 
		
		x=6'b000000;
		y=6'b000000;
		chave=0;
 
 // projetar testes do somador complete 
 
 $monitor("chave=%b carryOut=%b s=%b%b%b%b%b%b ",chave,carryOut,s5,s4,s3,s2,s1,s0);
 #1 chave=1;
 #1 x=6'b000011; y=6'b000001;
 #1 chave=0; x=6'b000010; y=6'b000010;
  
 end 
 
endmodule  
 