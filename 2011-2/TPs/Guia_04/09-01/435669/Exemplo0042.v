// ------------------------- 
// Exemplo0041 – FULL SUBTRACTOR 
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  full subtractor
// ------------------------- 
module fullSubtractor (output [5:0] s, output [5:0] borrowOut, 
                       input  [5:0] x,  input  [5:0] y,  input  [5:0] borrowIn);
										 
	wire [5:0] w1;
	wire [5:0] w2;
	wire [5:0] w3;
	wire [5:0] nw1;	
 
// descrever por portas

 xor xor1 [5:0] (w1,x,y);
 not not1 [5:0] (nx,x);
 and and1 [5:0] (w2,y,nx);
 xor xor2 [5:0] (s,w1,borrowIn);
 not not2 [5:0] (nw1,w1);
 and and2 [5:0] (w3,borrowIn,nw1);
 or  or1  [5:0] (borrowOut,w3,w2); 
 
endmodule // fullSubtractor 
 
module test_fullSubtractor; 
// ------------------------- definir dados 

   reg  [5:0] x,y,borrowIn;
	wire [5:0] s,borrowOut;
	
	fullSubtractor modulo1 (s,borrowOut,x,y,borrowIn);
	
	initial begin
	
	x= 6'b111111;
	y= 6'b000000;	
	borrowIn=6'b000000;
	end
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test ALU’s full subtractor"); 
 
 // projetar testes do somador complete 
 
 $monitor("x=%6b  y=%6b borrowIn=%6b s=%6b borrowOut=%6b" , x,y,borrowIn,s,borrowOut);
 #1 borrowIn=6'b000001;
 #1 borrowIn=6'b111111;
 #1 x=6'b111111; y=6'b000001;

 end 
 
endmodule // test_fullSubtractor 
 