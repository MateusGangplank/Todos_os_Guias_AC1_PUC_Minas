// Breno Macena Pereira de Souza
// mat.: 462017

// ----------------
// Contador assincrono decrescente em anel
// ----------------

module jkff (output q, output qnot,
   input j, input k, input clk);
   reg q = 0, qnot = 1;
   always @(posedge clk)
      begin
         if (j & ~k)
          begin
            q <= 1; qnot <= 0;
          end
         else
         if (~j & k)
          begin
            q <= 0; qnot <= 1;
          end
         else
         if (j & k)
          begin
            q <= ~q; qnot <= ~qnot;
          end
         end
endmodule

module cont_assin_decresc (q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5, j, k, clk);
   input j, k, clk;
   output q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5;

   jkff JK1 (q5, qnot5, j, k, clk);
   jkff JK2 (q4, qnot4, j, k, q5);
   jkff JK3 (q3, qnot3, j, k, q4);
   jkff JK4 (q2, qnot2, j, k, q3);
   jkff JK5 (q1, qnot1, j, k, q2);
   jkff JK6 (q0, qnot0, j, k, q1);

endmodule

module teste;
   reg j, k, clk;
   wire a;
   wire q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5;

   or OR (a, q0, j, k);

   cont_assin_decresc cont (q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5, a, a, clk);

   initial
      begin
         clk = 0;     j = 1;      k = 1;
      #2000 $finish;
      end

    always
      #5 clk = ~clk;

    always @ (posedge clk)
      begin
         $display ("%d   %b %b %b %b %b %b", $time, q0, q1, q2, q3 ,q4 ,q5);
      end
endmodule