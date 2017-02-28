// ---------------
// Exemplo0037 - F4 - LU 07
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 23/08/2012
// ----------------

// ----------------
// maior
// ----------------
module maior(output s0, input a, input b);

//Definição dos fios do subcircuito
wire b_n;

//Definição por portas
not not1(b_n, b);
and and1(s0, a, b_n);

endmodule//maior

// ----------------
// menor
// ----------------
module menor(output s1, input a, input b);

//Definição dos fios do subcircuito
wire a_n;

//Definição por portas
not not2(a_n, a);
and and2(s1, a_n, b);

endmodule//menor

// ----------------
// LU 07
// ----------------
module lu07(output saida, input a, input b, input chave);

//Declaração dos fios do circuito
wire s0, s1, c0, c1, d0, d1;

//Definição das operações da LU
maior ma1(s0, a, b);
menor me1(s1, a, b);

//Definição da LU
not not3(c1, chave);
buf buf1(c0, chave);
and and3(d0, s0, c0); //Representa a operação maior
and and4(d1, s1, c1); //Representa a operação menor
or or1(saida, d0, d1);

endmodule// lu07

// ----------------
// f4
// ----------------
module f4(output [1:0]s, input [1:0]a, input [1:0]b, input chave);

//Instância a LU
lu07 l1(s[0], a[0], b[0], chave);
lu07 l2(s[1], a[1], b[1], chave);

endmodule

// ----------------
// test f4
// ----------------
module test_f4;

// ---------------- Definição de variáveis
reg [1:0]x;
reg [1:0]y;
wire [1:0]z;
reg chave;
     
// ---------------- Instância
f4 modulo(z, x, y, chave);

// ---------------- Preparação
 initial begin: start
   x = 2'b00; y = 2'b01;
   chave = 1'b0;
 end

// ----------------- Parte principal
 initial begin: main
    $display("Exemplo0037 - Josemar Alves Caetano - 448662");
    $display("Test LU's module");

   // Projetar testes do modulo

  #1 $display("\nTeste do menor:\n");
     $display("%b < %b? Resp.: %b", x, y, z);
     x = 2'b01; y = 2'b10;

  #1 $display("%b < %b? Resp.: %b", x, y, z);
     x = 2'b10; y = 2'b11;

  #1 $display("%b < %b? Resp.: %b", x, y, z);
     x = 2'b11; y = 2'b00;

  #1 $display("%b < %b? Resp.: %b", x, y, z);
     x = 2'b00; y = 2'b01;
     chave = 1'b1;

  #1 $display("\nTeste do maior:\n");
     $display("%b > %b? Resp.: %b", x, y, z);
     x = 2'b01; y = 2'b10;

  #1 $display("%b > %b? Resp.: %b", x, y, z);
     x = 2'b10; y = 2'b11;

  #1 $display("%b > %b? Resp.: %b", x, y, z);
     x = 2'b11; y = 2'b00;

  #1 $display("%b > %b? Resp.: %b", x, y, z);

 end

endmodule //test_f4








