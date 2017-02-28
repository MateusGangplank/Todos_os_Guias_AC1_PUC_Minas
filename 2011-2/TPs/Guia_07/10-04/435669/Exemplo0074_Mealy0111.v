/* 
PUC-Minas - Ci�ncia da Computa��o 
ARQ1 � Guia 07 
Per�odo: 12-16/09/2011 
--------------------------------------------------------------- 
Tema: Introdu��o � linguagem Verilog 
Atividade: Circuitos sequenciais � M�quinas de estado finito (FSM) 
--------------------------------------------------------------- 
Mateus Augusto Moraes Ferreira   Matricula:435669
---------------------------------------------------------------  
06.) Projetar e descrever em Verilog um m�dulo 
para implementar uma m�quina de estados finitos, 
capaz de reconhecer a primeira sequ�ncia 
(0111) que aparecer. 
O nome do arquivo dever� ser Exemplo0054.v. 
Incluir previs�o de testes e verifica��o do circuito 
pelo Logisim. 
--------------------------------------------------------------- 
*/


// -------------- 
// --- Mealy0111 
// -------------- 


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

endmodule 											