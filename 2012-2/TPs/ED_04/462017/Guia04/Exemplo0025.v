// -------------------------
// Exemplo0025 – C2
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// C2
// -------------------------
module c2 (output [2:0] s, output carryOut, input [2:0] e);
   wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14;

   not NOT1 (s0, e[1]);
   and AND1 (s1, s0, e[2]);
   or OR1 (s[0], s1, e[0]); //saida do primeiro bit

   xor XOR1 (s2, e[1], e[0]);
   not NOT2 (s3, e[1]);
   and AND2 (s4, s3, e[2]);
   or OR2 (s[1], s4, s2);  //saida do segundo bit

   not NOT3 (s5, e[2]);
   and AND3 (s6, s5, e[0]);
   not NOT4 (s7, e[2]);
   and AND4 (s8, s7, e[1]);
   not NOT5 (s9, e[1]);
   not NOT6 (s10, e[0]);
   and AND5 (s11, s9, s10, e[2]);
   or OR3 (s[2], s6, s8, s11); // saida do terceiro bit

   not NOT7 (s12, e[0]);
   not NOT8 (s13, e[1]);
   not NOT9 (s14, e[2]);
   and AND6 (carryOut, s12, s13, s14);

endmodule

module test_c2;

   reg [2:0] a;
   wire carryOut;
   wire [2:0] s;

   c2 C2 (s, carryOut, a);

initial begin
   $display("Exemplo0025 - Breno Macena - 462017");
   $display("Test ALU’s c2");

#1 a = 3'b000;
#1 $monitor("C2(%b) = %b %b",a, carryOut, s);

#1 a = 3'b001;
#1 a = 3'b010;
#1 a = 3'b011;
#1 a = 3'b100;
#1 a = 3'b101;
#1 a = 3'b110;
#1 a = 3'b111;

end
endmodule