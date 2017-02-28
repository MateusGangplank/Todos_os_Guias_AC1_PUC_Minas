// Breno Macena Pereira de Souza
// mat.: 462017

// ----------------
// Contador decadico crescente
// ----------------

module jkff (output q, output qnot,
   input j, input k, input clk, input clear);
   reg q = 0, qnot = 1;

   always
    begin
#5   if (clear)
      begin
       q = 0;  qnot = 1;
      end
    end
   always @(posedge clk)
      begin
        if (j & ~k)
         begin
          q = 1;  qnot = 0;
         end
        else if (~j & k | clear)
         begin
          q = 0;  qnot = 1;
         end
        else if (j & k)
         begin
          q <= ~q;  qnot <= ~qnot;
         end
      end
endmodule

module cont_assin_decresc (q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5, j, k, clk, clear);
   input j, k, clk, clear;
   output q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5;

   jkff JK1 (q5, qnot5, j, k, clk, clear);
   jkff JK2 (q4, qnot4, j, k, qnot5, clear);
   jkff JK3 (q3, qnot3, j, k, qnot4, clear);
   jkff JK4 (q2, qnot2, j, k, qnot3, clear);
   jkff JK5 (q1, qnot1, j, k, qnot2, clear);
   jkff JK6 (q0, qnot0, j, k, qnot1, clear);

endmodule

module teste;
   reg j, k, clk, cls;
   wire q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5;
   wire clear, c, s0, s1;

   not NOT1 (s0, qnot2);
   not NOT2 (s1, qnot4);
   nand NAND1 (c, qnot0, qnot1, s0, qnot3, s1, qnot5);
   nand NAND2 (clear, c, cls);

   cont_assin_decresc cont (q0, q1, q2, q3, q4, q5, qnot0, qnot1, qnot2, qnot3, qnot4, qnot5, j, k, clk, clear);

   initial
      begin
          clk = 0;     j = 1;      k = 1;       cls = 1;
      #200 $finish;
      end

    always
      #5 clk = ~clk;

    always @ (negedge clk)
      begin
         $display ("%d   %b %b %b %b %b %b", $time, q0, q1, q2, q3, q4, q5);
      end
endmodule