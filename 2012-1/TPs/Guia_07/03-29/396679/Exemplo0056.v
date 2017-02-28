// -------------------------
// Exemplo0056 - Mealy (000 ou  111)
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//------
//--Mealy FSM
//------

//constant definitions
`define found 1
`define notfound 0

//FSM by Mealy
module mealy000111(y, x, clk, reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;

	parameter //state identifiers
	start = 3'b000, 
	
	id1 = 3'b001, 
	id11 = 3'b011, 
	
	id110 = 3'b010,
	id010 = 3'b000;

	reg[1:0]E1; //current state variables
	reg[1:0]E2; //next stat logic output

	//next state logic
	always @(x or E1) begin
		y = `notfound;
	case(E1)
	start:
		if(x)
			E2 = id1;
		else
			E2 = id11;
//----------------------------------------	
	id1:
		if(x)
			E2 = id110;
		else
			E2 = id11;
	id11:
		if(x)
			E2 = id1;
		else
			E2 = id010;			
//----------------------------------------				
	//----------------------------//
//----------------------------------------	
   id110:
		if(x) begin
			E2 = start;
			y = `found;
		end
		else begin
			E2 = id11;
			y = `notfound;
		end
		
	id010:
		if(x) begin
			E2 = id1;
			y = `notfound;
		end
		else begin
			E2 = start;
			y = `found;
		end
//----------------------------------------		
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

endmodule // mealy000111	

module testMealy000111; 
	reg clk, reset, x; 
	wire m1; 
		
		mealy000111 mealy1 ( m1, x, clk, reset ); 

	initial begin 
		$display ("Exemplo0056 - Bruno Cezar Andrade Viallet - 396679");
		$display ( "Time 	X  Mealy" ); 
		
		// initial values 
		clk = 1; 
		reset = 0; 
		x = 0; 
		
		// input signal changing 
		#5 reset = 1; 
		#10 x = 1; 
		#10 x = 1; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 0;
		#10 x = 0; 
		#10 x = 1; 
		#10 x = 1;
		#10 x = 1; 
		#10 x = 0; 
		#10 x = 0; 
		#10 x = 1; 
		#10 x = 1; 
		#10 x = 1;
		#30 $finish; 
		
	end // initial 
		
	always 
		#5 clk = ~clk; 
		
	always @( posedge clk ) begin 
		$display ( "%4d %4b %4b", $time, x, m1 ); 
	
	end // always at positive edge clocking changing 

endmodule // testMealy000111													