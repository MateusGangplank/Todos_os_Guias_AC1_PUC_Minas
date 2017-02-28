// ------------------------- 
// Exemplo0041 – Soma Completa
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  somacompleta
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
 
endmodule // fullAdder 

 module somacompleta2;
 	
 reg [5:0] x;
 reg carryIn;
 reg y;							  									  
 wire s0,s1,s2,s3,s4,s5,w1,w2,w3,w4,w5,carryOut;
 wire [5:0] notx;				  
					
 not not1[5:0] (notx,x);							  
 somacompleta soma1 (s0,w1,notx[0],y,carryIn);
 somacompleta soma2 (s1,w2,notx[1],y,w1);
 somacompleta soma3 (s2,w3,notx[2],y,w2);
 somacompleta soma4 (s3,w4,notx[3],y,w3);
 somacompleta soma5 (s4,w5,notx[4],y,w4);
 somacompleta soma6 (s5,carryOut,notx[5],y,w5);
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0045 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test Complemento 2"); 
		
		y=0;
		carryIn=1;
		x=6'b000000;
 
 // projetar testes do somador complete 
 
 $monitor("carryOut=%b x=%b%b%b%b%b%b ",carryOut,s5,s4,s3,s2,s1,s0,);
 #1 x=6'b000001;
 #1 x=6'b000010;
 #1 x=6'b000011;
  
 end 
 
endmodule // test_Comparator
 