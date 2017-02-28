// -------------------------
// Exemplo0054 - Mealy (1110) com interseção
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//------
//--Mealy FSM
//------

//constant definitions
`define found 1
`define notfound 0
`define inicio 1
`define fim 0

//FSM by Mealy
module mealy1110(y, x, clk, reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;

	reg z = 0;
	
	parameter //state identifiers
	start = 2'b00, 
	id1 = 2'b01, 
	id11 = 2'b11, 
	id110 = 2'b10;
	
	reg[1:0]E1; //current state variables
	reg[1:0]E2; //next stat logic output
	
	//next state logic
	always @(x or E1) begin
		y = `notfound;
	if(z == 0)	
	case(E1)
	start:
		if(x)
			E2 = id1;
		else
			E2 = start;
	
	id1:
		if(x)
			E2 = id11;
		else
			E2 = start;
	
	id11:
		if(x)
			E2 = id110;
		else
			E2 = start;

   id110:
		if(x) begin
			E2 = id110;
			y = `notfound;
		end
		
		else	begin
			y = `found;
			z = 1;
		end
		
	default:  //undefined state
		E2 = 2'bxx;
	endcase
	
	end // always at signal or state changing

	//state variables
	always @(posedge clk or negedge reset) begin
		if(reset)
			E1 = E2; //updates current state
		else
			E1 = 0; //reset

	end // always at signal changing

endmodule // mealy1001	

module testMealy1110; 
	reg clk, reset, x; 
	wire m1; 
		
		mealy1110 mealy1 ( m1, x, clk, reset ); 

	initial begin 
		$display ("Exemplo0054 - Bruno Cezar Andrade Viallet - 396679");
		$display ( "Time 	X  Mealy" ); 
		
		// initial values 
		clk = 1; 
		reset = 0; 
		x = 0; 
		
		// input signal changing 
		#5 reset = 1; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 1; 
		#10 x = 1; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1; 
		#30 $finish; 
		
	end // initial 
		
	always 
		#5 clk = ~clk; 
		
	always @( posedge clk ) begin 
		$display ( "%4d %4b %4b", $time, x, m1 ); 
	
	end // always at positive edge clocking changing 

endmodule // testMealy1110												