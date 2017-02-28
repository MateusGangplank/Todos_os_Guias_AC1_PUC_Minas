// -------------------------------------
// --- Pedro Henrique Lima Pinheiro ----
// --- 451605 --------------------------
// -------------------------------------

module dff (output q, output qnot, input d, input clk);
       reg q = 0, qnot = 1;
  always @(posedge clk)
   begin
     q <= d; qnot <= ~d;
   end
endmodule

// ------------ modulo deslocador
module deslocador (q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4, d, clk);
       output q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4;
       input d, clk;

       dff DFF1 (q4, qnot0, d, clk);
       dff DFF2 (q3, qnot1, q4, clk);
       dff DFF3 (q2, qnot2, q3, clk);
       dff DFF4 (q1, qnot3, q2, clk);
       dff DFF5 (q0, qnot4, q1, clk);

endmodule

module teste;
reg data;
reg clk;
wire a;
wire q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4;

// ------------- porta OR
or OR (a, data, qnot4);

deslocador d (q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4, a, clk);

  initial
        begin
               $display("Data  clock");
               data = 1;  clk = 1;
               #10 data = 0;
               #90 $finish;
        end

        always
               #5      clk = ~clk;


        always @ (posedge clk)
               begin
                    $display ("%b       %b       %b %b %b %b %b", data, clk, q0, q1, q2, q3, q4);
               end
endmodule