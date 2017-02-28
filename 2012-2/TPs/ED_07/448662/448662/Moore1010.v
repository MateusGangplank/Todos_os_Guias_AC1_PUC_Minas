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
module moore1010(y, x, clk, reset);
output y;
input x;
input clk;
input reset;

reg y;

parameter //Identificadores de estado
 start = 3'b000,
 id1 = 3'b001,
 id10 = 3'b010, 
 id101 = 3'b101,
 id1010 = 3'b110; // Sinal encontrado
 
reg [2:0] E1; // Estado atual das variáveis
reg [2:0] E2; // Próximo estado lógico de saída

//Próximo estado lógico
 always @( x or E1 )
  begin
   case( E1 )
    start:
     if ( x )
      E2 = id1;
     else
      E2 = start;
    id1:
     if ( ~x )
      E2 = id10;
     else
      E2 = start;
    id10:
     if ( x )
      E2 = id101;
     else
      E2 = id1;
    id101:
     if ( ~x )
      E2 = id1010;
     else
      E2 = start;
    id1010:
     if ( x )
      E2 = id10;
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
    y = E1[1] & E1[2]; // Primeiro bit do valor do estado (indicador MOORE)
   end // always at state changing
	
endmodule // moore1010

