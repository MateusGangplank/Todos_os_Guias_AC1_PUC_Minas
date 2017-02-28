// -------------------------
// Exemplo0023 – Comparador de igualdade
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// compare
// -------------------------
module compare (output s, input a, input b, input c);
   wire s0, s1, s2, s3;

   xnor XNOR1 (s0, a, b);
   xnor XNOR2 (s1, a, c);
   xnor XNOR3 (s2, b, c);
   and AND1 (s3, s0, s1);
   and AND2 (s, s2, s3);

endmodule

module fullCompare (output [2:0] s, input [2:0] a, input [2:0] b, input c);

   compare COM1 (s[0], a[0], b[0], c);
   compare COM2 (s[1], a[1], b[1], c);
   compare COM3 (s[2], a[2], b[2], c);

endmodule

module test_fullCompare;

   reg [2:0] x;
   reg [2:0] y;
   reg c;
   wire [2:0] s;

   fullCompare FULL (s, x, y, c);

initial begin
   $display("Exemplo0023 - Breno Macena - 462017");
   $display("Test ALU’s full compare");

#1 x = 3'b000; y = 3'b000; c = 0;
#1 $monitor("%b  %b  %b = %b",x,y,c,s);

#1 x = 3'b000; y = 3'b000; c = 0;
#1 x = 3'b001; y = 3'b000; c = 0;
#1 x = 3'b010; y = 3'b000; c = 0;
#1 x = 3'b100; y = 3'b000; c = 0;
#1 x = 3'b111; y = 3'b111; c = 1;
#1 x = 3'b110; y = 3'b111; c = 1;
#1 x = 3'b101; y = 3'b111; c = 1;
#1 x = 3'b100; y = 3'b111; c = 1;

end
endmodule