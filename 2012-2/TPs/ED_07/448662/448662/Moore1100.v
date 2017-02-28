// ---------------
// Moore - M�quinas de estado finito - Moore FSM
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 20/09/2012
// ----------------

// ----------------
// Moore FSM
// ----------------

// Defini��o de constantes
`define found 1
`define notfound 0

// FSM por Moore
module moore1100(y, x, clk, reset);
output y;
input x;
input clk;
input reset;

reg y;

parameter //Identificadores de estado
 start = 3'b000,
 id1 = 3'b001,
 id11 = 3'b011, 
 id110 = 3'b110,
 id1100 = 3'b111; // Sinal encontrado
 
reg [2:0] E1; // Estado atual das vari�veis
reg [2:0] E2; // Pr�ximo estado l�gico de sa�da

//Pr�ximo estado l�gico
 always @( x or E1 )
  begin
   case( E1 )
    start:
     if ( x )
      E2 = id1;
     else
      E2 = start;
    id1:
     if ( x )
      E2 = id11;
     else
      E2 = start;
    id11:
     if ( ~x )
      E2 = id110;
     else
      E2 = id1;
    id110:
     if ( ~x )
      E2 = id1100;
     else
      E2 = start;
    id1100:
     if ( x )
      E2 = id1;
     else
      E2 = start;
    default: // Estado indefinido
      E2 = 3'bxxx;
 endcase
 
end //Sempre em sinal ou mudan�a de estado

// Vari�veis de estado
  always @( posedge clk or negedge reset )
   begin
    if ( reset )
     E1 = E2; //Atualize o estado atual
    else
     E1 = 0; // reset
   end //Sempre em mudan�a de sinal
	
// Sa�da l�gica
  always @( E1 )
   begin
    y = E1[2] & (~E1[0]); // Primeiro bit do valor do estado (indicador MOORE)
   end // always at state changing
	
endmodule // moore1100

