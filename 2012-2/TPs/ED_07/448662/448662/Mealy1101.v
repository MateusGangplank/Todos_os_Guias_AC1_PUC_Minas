// ---------------
// Mealy1101 - M�quinas de estado finito - Mealy FSM
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 17/09/2012
// ----------------

// ----------------
// Mealy FSM
// ----------------

// Defini��o de constantes
 `define found 1
 `define notfound 0
 
// FSM por Mealy
module mealy1101(y, x, clk, reset);
output y;
input x;
input clk;
input reset;

reg y;

parameter //Identificadores de estado
 start = 2'b00,
 id1   = 2'b01,
 id11  = 2'b11,
 id110 = 2'b10;
 
 reg[1:0] E1; //Estado atual das vari�veis
 reg[1:0] E2; //Pr�ximo estado l�gico de sa�da
 
//Pr�ximo estado l�gico
 always @(x or E1)
  begin
   y = `notfound;
   case(E1)

    start:
     if(x)
      E2 = id1;
     else
      E2 = start;
    id1:
     if(x)
      E2 = id11;
     else
      E2 = start;
    id11:
     if(x)
      E2 = id11;
     else
      E2 = id110;
    id110:
     if(x)
      begin
       E2 = id1;
       y = `found;
      end
     else
      begin
       E2 = start;
       y = `notfound;
      end
    default: //Estado indefinido
      E2 = 2'bxx;
   endcase
 end //Sempre em sinal ou mudan�a de estado
 
// Vari�veis de estado
 always @(posedge clk or negedge reset)
  begin
   if(reset)
    E1 = E2; //Atualize o estado atual
   else
    E1 = 0; //Resete
  end //Sempre em mudan�a de sinal

endmodule //mealy1101
