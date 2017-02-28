// ------------------------- 
// Exemplo0041 – FULL SUBTRACTOR 
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  full subtractor
// ------------------------- 
module fullSubtractor (output s,  
                       input  [5:0] x,  input  [5:0] y);
										 
	wire [5:0] w1;
	wire [5:0] w2;
	wire [5:0] w3;
	wire [5:0] w4;
	wire [5:0] w5;
	wire [5:0] w6;	
 
// descrever por portas

 xnor xnor1 [5:0] (w1,x,y);
 xnor xnor2 [5:0] (w2,x,y);
 xnor xnor3 [5:0] (w3,x,y);
 xnor xnor4 [5:0] (w4,x,y);
 xnor xnor5 [5:0] (w5,x,y);
 xnor xnor6 [5:0] (w6,x,y);
 and  and1  (s,w1[0:0],w2[1:1]);
 and  and2  (s,w3[2:2],w4[3:3]);
 and  and1  (s,w5[3:3],w6[4:4]);

  
endmodule // fullSubtractor 
 
module test_fullSubtractor; 
// ------------------------- definir dados 

   reg  [5:0] x,y;
	wire [5:0] w1,w2,w3,w4,w5,w6;
	
	fullSubtractor modulo1 (s,x,y);
	
	initial begin
	
	x= 6'b000000;
	y= 6'b000000;	
	end
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test ALU’s full subtractor"); 
 
 // projetar testes do somador complete 
 
 $monitor("x=%6b  y=%6b s=%1b", x,y,s);
 #1 x= 6'b111111; y= 6'b000000;
 
 end 
 
endmodule // test_fullSubtractor 
 