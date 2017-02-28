// ------------------------- 
// Exemplo0041 – FULL ADDER 
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  full adder 
// ------------------------- 
module fullAdder (output [5:0] s, output [5:0] carryOut, 
                  input  [5:0] x,  input  [5:0] y,  input  [5:0] carryIn);
										 
	wire [5:0] w1;
	wire [5:0] w2;
	wire [5:0] w3;	
 
// descrever por portas

 xor xor1 [5:0] (w1,x,y);
 and and1 [5:0] (w2,x,y);
 xor xor2 [5:0] (s,w1,carryIn);
 and and2 [5:0] (w3,w1,carryIn);
 or  or1  [5:0] (carryOut,w3,w2); 
 
endmodule // fullAdder 
 
module test_fullAdder; 
// ------------------------- definir dados 

   reg [5:0] x,y,carryIn;
	wire [5:0] s,carryOut;
	
	fullAdder modulo1 (s,carryOut,x,y,carryIn);
	
	initial begin
	
	x= 6'b111111;
	y= 6'b000000;	
	carryIn=6'b000000;
	end
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test ALU’s full adder"); 
 
 // projetar testes do somador complete 
 
 $monitor("x=%6b  y=%6b carryIn=%6b s=%6b carryOut=%6b" , x,y,carryIn,s,carryOut);
 #1 carryIn=6'b000001;

 end 
 
endmodule // test_fullAdder 
 