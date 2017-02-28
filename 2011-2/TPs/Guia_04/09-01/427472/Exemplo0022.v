// -------------------------
// Exemplo0022
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

module fullSubt (output [5:0]s,
						output [5:0]carryOut, 
                  input [5:0]a, 
                  input [5:0]b, 
                  input [5:0]carryIn); 

	wire [5:0] sxor1;
	wire [5:0] sand1;
	wire[5:0] sand2;
	wire[5:0]not1;
	wire[5:0]not2;

	xor XOR1 [5:0] (sxor1,a,b);
	not NOT1[5:0] (not1,sxor1);
	and AND1 [5:0] (sand1,a,b);
	not NOT2[5:0] (not2,sand1);
	and AND2 [5:0] (sand2,not1,carryIn);
	xor XOR2 [5:0] (s,sxor1,carryIn);
	or OR1 [5:0] (carryOut,sand2,not2);

endmodule //fullSubt;

	module test_fullSubt; 
	
// ------------------------- definir dados 
           reg [5:0] x; 
           reg [5:0] y; 
           reg  [5:0]carryIn;
			  wire [5:0]carryOut; 
           wire [5:0] subt; 
			  
			 
			  
	fullSubt ERROR (subt,carryOut,x,y,carryIn);
	
// ------------------------- parte principal
 initial begin
 		x = 6'b000000;		y=6'b111111;	carryIn=6'b000000;
		
   $display("Exemplo0021 - Wender Zacarias Xavier - 427472");
	$display("Test Full Subtrator");
	$display("\n *** Resultado ***  ");
	$monitor("x = %b 	 y = %b 	carryIn = %b	Sub = %b	 carryOut = %b",x,y,carryIn,subt,carryOut);
#1 x=6'b001111;	y = 6'b111011;
#1 carryIn = 6'b000010;
			
		end

endmodule //circ
