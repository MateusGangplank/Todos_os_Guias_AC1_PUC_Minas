//-----------------
//Rafael Lopes Barbosa
//435052
//------------------

//------
//--Mealy FSM
//------

//constant definitions
`define found 1
`define notfound 0

//FSM by Mealy
module mealy0111(y, x, clk, reset);

output y;
input x;
input clk;
input reset;

reg y;

parameter //state identifiers
start = 2'b00,
id01  = 2'b01,
id011 = 2'b11,
id0111= 2'b10;


reg[1:0]E1;//current state variables
reg[1:0]E2;//next stat logic output

//next state logic
always @(x or E1)
begin
	y = `notfound;
case(E1)
	start:
		if(x)
			E2 = start;
		else
			E2 = id01;
id01:
	if(x)
		E2 = id011;
	else
		E2 =	id01;
id011:
	if(x)
		E2 = id0111;
	else
		E2 = id01;	
id0111:
	if(x)
		begin
			E2 = id01;
			y = `found;
			end
	else
	begin
		E2 = start;
		y = `notfound;
	end
default:  //undefined state
	E2 = 2'bxx;
endcase

end // always at signal or state changing

//state variables
always @(posedge clk or negedge reset)
begin
if(reset)
E1 = E2; //updates current state
else
E1 = 0; //reset

end // always at signal changing

endmodule // mealy0111														