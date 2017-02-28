// Exemplo0055 - EXTRA
// Aluno: Roger Rubens Machado
// Matricula: 430533 

//-----------
//--Mealy FSM
//-----------

//constant definitions
`define found 1
`define notfound 0

//FSM by Mealy
module mealyx111(y, x, clk, reset);

output y;
input x;
input clk;
input reset;

reg y;

parameter //state identifiers
start = 2'b00,
id1 = 2'b01,
id011=2'b11,
id110=2'b10;


reg[1:0]E1;//current state variables
reg[1:0]E2;//next stat logic output

//next state logic
always @(x or E1)
begin
	y = `notfound;
case(E1)
	start:
		if(x)
			E2 = id1;
		else
			E2 = id1;
id1:
	if(x)
		E2 = id011;
	else
		E2 =	id1;
id011:
	if(x)
		E2 = id110;
	else
		E2 = id011;	
id110:
	if(x)
		begin
			E2 = id1;
			y = `found;
	   end
else
	begin
		E2 = id1;
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

endmodule // mealyx111										