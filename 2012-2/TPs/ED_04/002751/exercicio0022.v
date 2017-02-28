  // ------------------------- 
// Exemplo0022 - Full-subtrator 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 
`include "FullAdder.v"

module fullSubtrator(output[2:0]s,input[1:0]a,input[1:0]b,input carryIn);
 wire w[1:0];
 wire carryOut[1:0];
 xor xor1(w[0],b[0],carryIn);
 xor xor2(w[1],b[1],carryIn);
 
 fullAdder fa1(s[0],carryOut[0],a[0],w[0],carryIn);
 fullAdder fa2(s[1],carryOut[1],a[1],w[1],carryOut[0]);
 xor xor3(s[2],carryOut[1],carryIn);
 
endmodule //fullSubtrator

module principal;
	reg [1:0]x,y;
	reg carryIn;
	wire [2:0]s;
	fullSubtrator fs1(s,x,y,carryIn);
	initial begin
		carryIn = 1;
		x = 0; y = 0;
		$display("Exemplo0022 -  Milton costa teles da silva - 002751"); 
		$display("Test ALU's full subtractor");
		$display("\t  a - b  = saida");
		$monitor("\t %2b - %2b = %3b",x,y,s);
	  #1 y = 2'b01; 
	  #1 y = 2'b10;
	  #1 y = 2'b11;
	  #1 x = 2'b01; y = 2'b00;
	  #1 y = 2'b01; 
	  #1 y = 2'b10;
	  #1 y = 2'b11; 
	  #1 x = 2'b10; y = 2'b00;
	  #1 y = 2'b01; 
	  #1 y = 2'b10;
	  #1 y = 2'b11; 
	  #1 x = 2'b11; y = 2'b00; 
     #1 y = 2'b01; 
	  #1 y = 2'b10;
	  #1 y = 2'b11;
	  #1 y = 0;x = 0;
	  $display("\t  b - a  = saida");
	  $monitor("\t %2b - %2b = %3b",y,x,s);
	  #1 x = 2'b01; 
	  #1 x = 2'b10;
	  #1 x = 2'b11;
	  #1 y = 2'b01; x = 2'b00;
	  #1 x = 2'b01; 
	  #1 x = 2'b10;
	  #1 x = 2'b11; 
	  #1 y = 2'b10; x = 2'b00;
	  #1 x = 2'b01; 
	  #1 x = 2'b10;
	  #1 x = 2'b11; 
	  #1 y = 2'b11; x = 2'b00; 
     #1 x = 2'b01; 
	  #1 x = 2'b10;
	  #1 x = 2'b11;

 end
endmodule //principal
