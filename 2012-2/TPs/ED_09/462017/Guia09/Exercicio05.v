// Breno Macena Pereira de Souza
// mat.: 462017

// -----------
// Contador modulo 10
// -----------

module tff (output q, output qnot, input t, input clk, input preset, input clear);
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
     if (clear)
      begin
       q <= ~t; qnot <= t;
      end
     else
     if (preset)
      begin
       q <= 1; qnot <= 0;
      end
     else
      begin
     if (t)
      begin
       q <= ~q; qnot <= ~qnot;
      end
     end
    end
endmodule

module cont_mod_10 (q0, q1, q2, q3, qnot0, qnot1, qnot2, qnot3, t, clk, preset, clear);
   output q0, q1, q2, q3, qnot0, qnot1, qnot2, qnot3;
   input t, clk, preset, clear;

   tff TFF1 (q3, qnot3, t, clk, preset, clear);
   tff TFF2 (q2, qnot2, qnot3, qnot3, preset, clear);
   tff TFF3 (q1, qnot1, qnot2, qnot2, preset, clear);
   tff TFF4 (q0, qnot0, qnot1, qnot1, preset, clear);

endmodule

module teste;
   reg t, clk, clear, preset;
   wire q0, q1, q2, q3, qnot0, qnot1, qnot2, qnot3;
   wire s0, s1, s2, s;

   not NOT1 (s0, q1);
   not NOT2 (s1, q3);
   and AND1 (s2, q0, s0, q2, s1);
   or OR1 (s, s2, clear);

   cont_mod_10 c (q0, q1, q2, q3, qnot0, qnot1, qnot2, qnot3, clk, clk, preset, s);

   initial
     begin
       t = 0;  clk = 0;  clear = 0;   preset = 0;
       #200 $finish;
     end

   always
     #5 clk = ~clk;

   always @ (posedge clk)
     begin
       $display ("%d     %b %b %b %b", $time, q0, q1, q2, q3);
     end
endmodule