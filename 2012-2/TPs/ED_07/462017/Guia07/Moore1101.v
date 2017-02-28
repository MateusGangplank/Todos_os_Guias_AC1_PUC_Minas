// Breno Macena Pereira de Souza
// 462017

//---------------
//-- Moore FMS
//---------------

// definicao de constantes
`define found 1
`define notfound 0

module moore1101 (y, x, clk, reset);
   output y;
   input x;
   input clk;
   input reset;
   reg y;

 parameter  // identificadores de estado
   start  = 3'b000,
   id1    = 3'b001,
   id11   = 3'b011,
   id110  = 3'b010,
   id1101 = 3'b110; // sinal encontrado

   reg[2:0] E1; // estado atual da variavel
   reg[2:0] E2; // proximo stado da saida logica

   // proximo estado logico
 always @ (x or E1)
  begin
  case (E1)
   start:
    if (x)
     E2 = id1;
    else
     E2 = start;
   id1:
    if (x)
     E2 = id11;
    else
     E2 = start;
   id11:
    if (x)
     E2 = id11;
    else
     E2 = id110;
   id110:
    if (x)
     E2 = id1101;
    else
     E2 = start;
   id1101:
    if (x)
     E2 = id11;
    else
     E2 = start;
    default: // estado indefinido
     E2 = 3'bxxx;
  endcase
 end // sempre no sinal ou estado de mudanca

 // variaveis de estado
 always @ (posedge clk or negedge reset)
  begin
   if (reset)
    E1 = E2; // atualiza o stado atual
   else
    E1 = 0;  // reset
  end // sempre em mudanca de sinal
  
  // saida logica
  always @ (E1)
   begin
    y = E1[2]; // primeiro bit do valor do estado
   end // sempre em mudanca de sinal

endmodule // moore1101