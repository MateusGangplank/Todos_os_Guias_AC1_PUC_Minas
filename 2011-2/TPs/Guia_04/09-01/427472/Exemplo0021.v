// -------------------------
// Exemplo0021
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

module fullAdder (output [5:0]s,
						output [5:0]carryOut, 
                  input [5:0]a, 
                  input [5:0]b, 
                  input [5:0]carryIn); 

	wire [5:0] sxor1;
	wire [5:0] sand1;
	wire[5:0] sand2;

	xor XOR1 [5:0] (sxor1,a,b);
	and AND1 [5:0] (sand1,a,b);
	and AND2 [5:0] (sand2,sxor1,carryIn);
	xor XOR2 [5:0] (s,sxor1,carryIn);
	or OR1 [5:0] (carryOut,sand2,sand1);

endmodule //fullAdder;

	module test_fullAdder; 
	
// ------------------------- definir dados 
           reg [5:0] x; 
           reg [5:0] y; 
           reg  [5:0]carryIn;
			  wire [5:0]carryOut; 
           wire [5:0] soma; 
			  
			 
			  
	fullAdder ERROR (soma,carryOut,x,y,carryIn);
	
// ------------------------- parte principal
 initial begin
 		x = 6'b000000;		y=6'b111111;	carryIn=6'b000000;
		
   $display("Exemplo0021 - Wender Zacarias Xavier - 427472");
	$display("Test Full Adder");
	$display("\n *** Resultado ***  ");
	$monitor("x = %b 	 y = %b 	carryIn = %b	soma = %b	 carryOut = %b",x,y,carryIn,soma,carryOut);
#1 x=6'b001111;	y = 6'b111011;
#1 carryIn = 6'b000010;
			
		end

endmodule //circ
