// -------------------------
// Exemplo0031 - F4
// Nome: Jenifer Henrique
// Matricula: 427420
// -------------------------
// -------------------------
// f4_gate
// -------------------------
   module f4 (output [3:0] s, output [3:0] s1, input   [3:0] a, input   [3:0] b);
   // descrever por portas
   and AND1(s[0], a[0], b[0]);
   and AND2(s[1], a[1], b[1]);
   and AND3(s[2], a[2], b[2]);
   and AND4(s[3], a[3], b[3]);

   or OR1(s1[0], a[0], b[0]);
   or OR2(s1[1], a[1], b[1]);
   or OR3(s1[2], a[2], b[2]);
   or OR4(s1[3], a[3], b[3]);
   
   endmodule // f4

   module test_f4;
// ------------------------- definir dados
   reg [3:0] x;
   reg [3:0] y;
   wire [3:0] z;
   wire [3:0] z1;
   f4 modulo (z, z1, x, y);

// ------------------------- parte principal
   initial begin
   $display("Exemplo0031 - Jenifer Henrique - 427420");
   $display("Test LU's module");
   $display("\n A    |  B   | AND | OR ");
   $monitor("%3b %3b %3b %3b ",x,y,z,z1);

       //projetar testes do modulo
       x = 4'b0000;   y = 4'b0000;
       #1 x = 4'b0001;   y = 4'b0000;
       #1 x = 4'b0010;   y = 4'b0000;
       #1 x = 4'b0011;   y = 4'b0000;
       #1 x = 4'b0100;   y = 4'b0000;
       #1 x = 4'b0101;   y = 4'b0000;
       #1 x = 4'b0110;   y = 4'b0000;
       #1 x = 4'b0111;   y = 4'b0000;
       #1 x = 4'b1000;   y = 4'b1111;
       #1 x = 4'b1001;   y = 4'b1111;
       #1 x = 4'b1010;   y = 4'b1111;
       #1 x = 4'b1011;   y = 4'b1111;
       #1 x = 4'b1100;   y = 4'b1111;
       #1 x = 4'b1101;   y = 4'b1111;
       #1 x = 4'b1110;   y = 4'b1111;
       #1 x = 4'b1111;   y = 4'b1111;

   end
endmodule // test_f4