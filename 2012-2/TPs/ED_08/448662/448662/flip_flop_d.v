// ---------------
// Exemplo0057 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 27/09/2012
// ----------------

// ----------------
// Flip-Flop D
// ----------------
module flip_flop_d(output q, input data, input clk, input reset);

reg q;

always @(posedge clk)
 if (data & ~reset) 
  begin
   q = 1'b1;
  end
 else
  begin
   q = 1'b0;
  end

endmodule //flip_flop_d