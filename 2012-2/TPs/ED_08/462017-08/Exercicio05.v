// Breno Macena Pereira de Souza
// mat.: 462017

// -------------
// -- Conversor Paralelo-serie
// -------------

module dff (output q, output qnot, input d, input clk, input preset);
       reg q = 0, qnot = 1;
   always
     begin
#5    if (preset)
        begin
          q = 1; qnot = 0;
        end
      end
  always @(posedge clk)
   begin
     q <= d; qnot <= ~d;
   end
endmodule

module deslocador (q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4, d, clk, p0, p1, p2, p3, p4);
       output q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4;
       input d, clk;
       input p0, p1, p2, p3, p4;

       dff DFF1 (q0, qnot0, d, clk, p0);
       dff DFF2 (q1, qnot1, q0, clk, p1);
       dff DFF3 (q2, qnot2, q1, clk, p2);
       dff DFF4 (q3, qnot3, q2, clk, p3);
       dff DFF5 (q4, qnot4, q3, clk, p4);

endmodule

module teste;
       reg data;
       reg clk;
       reg ld;
       reg p0, p1, p2, p3, p4;
       wire q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4;
       wire s0, s1, s2, s3, s4;

       and AND1 (s0, p0, ld);
       and AND2 (s1, p1, ld);
       and AND3 (s2, p2, ld);
       and AND4 (s3, p3, ld);
       and AND5 (s4, p4, ld);

       deslocador d (q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4, data, clk, s0, s1, s2, s3, s4);

        initial
        begin
               $display("Data  clock");
               data = 0;  clk = 0;  ld = 1;   p0 = 1;  p1 = 0;  p2 = 1;  p3 = 0;  p4 = 1;
               #5 ld = 0;
               #50 $finish;
        end

        always
               #5      clk = ~clk;


        always @ (posedge clk)
               begin
                    $display ("%b       %b       %b %b %b %b %b", data, clk, q0, q1, q2, q3, q4);
               end

endmodule