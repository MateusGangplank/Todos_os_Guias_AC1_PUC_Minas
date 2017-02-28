// ---------------
// Exemplo0035 - VERIFICADOR DE: MAIOR, IGUAL E MENOR
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 08/09/2012
// ----------------

// ----------------
// ALU 07
// ----------------
module alu07(output [2:0]s, input [1:0]a, input [1:0]b);

//Definição dos fios do circuito
wire a1_n, a0_n, s0, s1, s2, s3,
     s4, s5,
     s6, b0_n, b1_n, s7, s8, s9;

//Definição do subcircuito comparador de menoridade
not not1(a1_n, a[1]);
not not2(a0_n, a[0]);
and and1(s0, a0_n, b[0]);
or or1(s1, a1_n, b[1]);
and and2(s2, s0, s1);
and and3(s3, a1_n, b[1]);
or or2(s[0], s2, s3);

//Definição do subcircuito comparador de igualdade
xnor xnor1(s4, a[0], b[0]);
xnor xnor2(s5, a[1], b[1]);
and and4(s[1], s4, s5);

//Definição do subcircuito comparador de maioridade
not not3(b0_n, b[0]);
and and5(s6, a[1], b0_n);
not not4(b1_n, b[1]);
or or3(s7, b1_n, a[0]);
and and6(s8, s6, s7);
and and7(s9, a[1], b1_n);
or or4(s[2], s8, s9);

endmodule //alu07

// ----------------
// Test ALU 07
// ----------------
module test_alu07;

// ---------------- Definição de dados
reg [1:0] x;
reg [1:0] y;
wire [2:0] s;

// ---------------- Instância
 alu07 a7(s, x, y);

// ---------------- Preparação
  initial begin: start
    x = 2'b00; y = 2'b00;
  end
  
// ----------------- Parte principal
  initial begin: main
     $display("Exemplo0037 - Josemar Alves Caetano - 448662.");
     $display("Test ALU's Comparador de: MAIOR IGUAL MENOR:\n");
  
   #1 $display("Comparador:\tMaior\tIgual\tMenor\n");
      $monitor("%b <=> %b? --> %b", x, y, s);

   #1 x = 2'b01; y = 2'b10;
   #1 x = 2'b10; y = 2'b01;
   #1 x = 2'b11; y = 2'b11;
  
  end //main
  
endmodule //test_alu07

