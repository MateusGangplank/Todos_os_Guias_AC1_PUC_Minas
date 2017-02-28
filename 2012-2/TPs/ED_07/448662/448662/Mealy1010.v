// ---------------
// Mealy1010 - Máquinas de estado finito - Mealy FSM
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 17/09/2012
// ----------------

// ----------------
// Mealy FSM
// ----------------

// Definição de constantes
 `define found 1
 `define notfound 0
 
// FSM por Mealy
module mealy1010(y, x, clk, reset);
output y;
input x;
input clk;
input reset;

reg y;

parameter //Identificadores de estado
 start = 2'b00,
 id1   = 2'b01,
 id10  = 2'b10;
 
 reg[1:0] E1; //Estado atual das variáveis
 reg[1:0] E2; //Próximo estado lógico de saída
 
//Próximo estado lógico
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
     if(~x)
      E2 = id10;
     else
	   begin
       E2 = start;
		 y = `notfound;
		end
    id10:
     if(x)
       E2 = id1;
     else
      begin
       E2 = id1;
       y = `found;
      end
    default: //Estado indefinido
      E2 = 2'bxx;
   endcase
 end //Sempre em sinal ou mudança de estado
 
// Variáveis de estado
 always @(posedge clk or negedge reset)
  begin
   if(reset)
    E1 = E2; //Atualize o estado atual
   else
    E1 = 0; //Resete
  end //Sempre em mudança de sinal

endmodule //mealy1010
