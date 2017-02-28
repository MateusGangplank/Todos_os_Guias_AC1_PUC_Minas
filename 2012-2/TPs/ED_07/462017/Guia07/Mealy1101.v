//Breno Macena Pereira de Souza
//462017

//---------------
//-- Mealy FMS
//---------------

// definicao de constantes
`define found 1
`define notfound 0

module mealy1101 (y, x, clk, reset);
   output y;
   input x;
   input clk;
   input reset;
   reg y;

 parameter  // identificadores de estado
   start = 2'b00,
   id1   = 2'b01,
   id11  = 2'b11,
   id110 = 2'b10;

   reg[1:0] E1; // estado atual da variavel
   reg[1:0] E2; // proximo stado da saida logica

   // proximo estado logico
 always @ (x or E1)
  begin
  y = `notfound;
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
     begin
      E2 = id1;
      y = `found;
     end
    else
     begin
      E2 = start;
      y = `notfound;
     end
    default: // estado indefinido
     E2 = 2'bxx;
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

endmodule // mealy1101