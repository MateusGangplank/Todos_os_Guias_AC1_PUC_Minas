 // ------------------------- 
// Exemplo0021 - Full-adder 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 
 `include "fulladder.v"

module test_fullAdder; 
// ------------------------- definir dados 
	reg [2:0] x; 
	reg [2:0] y; 
	reg carry; 
	wire [2:0] soma;
	
// ------------------------- instância
	fullAdder3bits fa1(soma,x,y,0);
	
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 -  Milton costa teles da silva - 002751"); 
		$display("Test ALU's full-adder"); 
		x = 3'b000;
		y = 3'b000;
		carry = 0;
		$display("\t   x + y   = soma");
		$monitor("\t %3b + %3b = %3b",x,y,soma);
	  #1 y = 3'b001;
	  #1 x = 3'b011; y = 3'b001; 
     #1 y = 3'b010; 
	  #1 y = 3'b011;  
	  #1 y = 3'b100;
	  #1 x = 3'b010; 
	  #1 y = 3'b101; 
	  #1 y = 3'b110;
	  #1 y = 3'b111;     	   
	end 
endmodule // test_fullAdder 