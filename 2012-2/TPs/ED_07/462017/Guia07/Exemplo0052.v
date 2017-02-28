//Breno macena Pereira de Souza
//462017

//---------------
//-- Mealy FMS
//---------------

// definicao de constantes
`define found 1
`define notfound 0

module mealy1010 (y, x, clk, reset);
   output y;
   input x;
   input clk;
   input reset;
   reg y;

 parameter  // identificadores de estado
   start = 2'b00,
   id1   = 2'b01,
   id10  = 2'b10,
   id101 = 2'b11;

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
     E2 = start;
    else
     E2 = id10;
   id10:
    if (x)
     E2 = id101;
    else;
   id101:
    if (x)
     begin
      E2 = start;
      y = `notfound;
     end
    else
     begin
      E2 = start;
      y = `found;
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
