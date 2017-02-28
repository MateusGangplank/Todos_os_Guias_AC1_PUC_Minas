// Exemplo-0032 - detectorZero 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 
`include "FullAdder.v"

module somadorAlgebrico(output s,input[2:0]a,input[2:0]b,input carryIn);
 wire [2:0]w;
 wire [2:0]s0;
 xor xor1(w[0],b[0],carryIn);
 xor xor2(w[1],b[1],carryIn);
 xor xor3(w[2],b[2],carryIn);
 
 fullAdder3bits fa1(s0,a,w,carryIn);
 detectorZero z1(s,s0);
endmodule //f3

module detectorZero(output s,input[2:0]x);
	nor nor1(s,x[0],x[1],x[2]);
endmodule //fim detectorZero

module principal;
	reg [2:0]x,y;
	reg carryIn;
	wire s;
	
	somadorAlgebrico as1(s,x,y,carryIn);
	
	initial begin
		carryIn = 1;
		x = 0; y = 0;
		$display("Exemplo0032 -  Milton costa teles da silva - 002751"); 
		$display("Test ALU's somadorAlgebrico");
		$display("\t  a - b  = SUBTRATOR");
		$monitor("%b %3b  %3b = %3b ",carryIn,x,y,s);
	  #1 x = 3'b011; y = 3'b001; 
     #1 y = 3'b010; 
	  #1 y = 3'b011;  
	  #1 y = 3'b100;
	  #1 y = 3'b010; 
	  #1 y = 3'b010; 
	  #1 y = 3'b110;
	  #1 y = 3'b111;
$display("  b - a  = saida");
	  #1 y = 3'b011; x = 3'b001; 
     #1 x = 3'b010; 
	  #1 x = 3'b011;  
	  #1 x = 3'b100;
	  #1 x = 3'b010; 
	  #1 x = 3'b010; 
	  #1 x = 3'b110;
	  #1 x = 3'b111;
$display(" a + b  = ADDER");
	  #1 carryIn = 0;
	  #1 x = 3'b001; y = 3'b001; 
     #1 y = 3'b010; 
	  #1 y = 3'b011;  
	  #1 y = 3'b100;
	  #1 y = 3'b010; 
	  #1 y = 3'b010; 
	  #1 y = 3'b110;
	  #1 y = 3'b111;
	  end
endmodule //principal
