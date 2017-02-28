// ---------------
// Flip - Flop JK - Ass�ncrono- Circuitos sequ�nciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 30/09/2012
// ----------------

module flip_flop_jk_ass( output q, output qnot, input j, input k, input clk, input clear, input preset);

reg q, qnot;

// Defini��o dos est�gios do flip flop
 always @( negedge clk )
  begin
   if (preset | (j & ~k & ~clear))
    begin    // Seta
     q = 1;
     qnot = 0;
    end
   else if ( ~j & k & ~clear)
    begin    // Reseta
     q = 0;
     qnot = 1;
    end
   else if ( j & k & ~clear)
    begin    // Toogle
     q = ~q;
     qnot = ~qnot;
    end
   else
    begin  // Hold ou apaga
     q = 0;
     qnot = 0;
    end
 end

endmodule // flip_flop_jk