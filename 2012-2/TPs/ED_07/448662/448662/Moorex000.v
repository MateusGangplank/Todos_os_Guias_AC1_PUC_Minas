// ---------------
// Moore - Máquinas de estado finito - Moore FSM
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 20/09/2012
// ----------------

// ----------------
// Moore FSM
// ----------------

// Definição de constantes
`define found 1
`define notfound 0

// FSM por Moore
module moorex000(y, x, clk, reset);
output y;
input x;
input clk;
input reset;

reg y;

parameter //Identificadores de estado
 start = 3'b000,
 idx = 3'b001,
 idx0 = 3'b010, 
 idx00 = 3'b100,
 idx000 = 3'b111; // Sinal encontrado
 
reg [2:0] E1; // Estado atual das variáveis
reg [2:0] E2; // Próximo estado lógico de saída

//Próximo estado lógico
 always @( x or E1 )
  begin
   case( E1 )
    start:
     if ( x )
      E2 = idx;
     else
      E2 = start;
    idx:
     if ( ~x )
      E2 = idx0;
     else
      E2 = start;
    idx0:
     if ( ~x )
      E2 = idx00;
     else
      E2 = idx;
    idx00:
     if ( ~x )
      E2 = idx000;
     else
      E2 = start;
    idx000:
     if ( x )
      E2 = idx;
     else
      E2 = start;
    default: // Estado indefinido
      E2 = 3'bxxx;
 endcase
 
end //Sempre em sinal ou mudança de estado

// Variáveis de estado
  always @( posedge clk or negedge reset )
   begin
    if ( reset )
     E1 = E2; //Atualize o estado atual
    else
     E1 = 0; // reset
   end //Sempre em mudança de sinal
	
// Saída lógica
  always @( E1 )
   begin
    y = E1[2]; // Primeiro bit do valor do estado (indicador MOORE)
   end // always at state changing
	
endmodule // moorex000

