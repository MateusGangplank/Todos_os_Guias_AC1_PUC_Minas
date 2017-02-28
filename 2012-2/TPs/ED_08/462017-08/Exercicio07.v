// Breno Macena Pereira de Souza
// mat.: 462017

// -------------
// -- Registrador de Deslocamento circular para a direita
// -- em anel torcido, com carga inicial em todos os estados
// -------------

module dff (output q, output qnot, input d, input clk, input preset);
       reg q = 0, qnot = 1;
  always
   begin
#5  if (preset)
     begin
       q <= 1; qnot <= 0;
     end
    end
  always @(posedge clk)
   begin
   if (~preset)
      begin
       q <= d; qnot <= ~d;
      end
   else
      begin
       q <= ~d; qnot <= d;
      end
   end
endmodule

module deslocador (q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4, d, clk, preset);
       output q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4;
       input d, clk, preset;

       dff DFF1 (q0, qnot0, d, clk, preset);
       dff DFF2 (q1, qnot1, q0, clk, preset);
       dff DFF3 (q2, qnot2, q1, clk, preset);
       dff DFF4 (q3, qnot3, q2, clk, preset);
       dff DFF5 (q4, qnot4, q3, clk, preset);

endmodule

module teste;
       reg data;
       reg clk;
       wire a;
       wire q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4;

       or OR (a, qnot4, data);

       deslocador d (q0, q1, q2, q3, q4, qnot0, qnot1, qnot2, qnot3, qnot4, a, clk, data);

        initial
        begin
               $display("Data  clock");
               data = 1;  clk = 1;
               #5 data = 0;
               #150 $finish;
        end

        always
               #5      clk = ~clk;


        always @ (posedge clk)
               begin
                    $display ("%b       %b       %b %b %b %b %b", data, clk, q0, q1, q2, q3, q4);
               end

endmodule