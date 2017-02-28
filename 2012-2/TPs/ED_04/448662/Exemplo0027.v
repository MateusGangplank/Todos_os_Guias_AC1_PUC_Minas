// ---------------
// Exemplo0027 - VERIFICADOR DE IGUALDADE E DIFERENÇA
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 30/08/2012
// ----------------

// ----------------
// LU 04
// ----------------
module lu04(output s, input a, input b, input sel);

//Definição dos fios do circuito
wire c_n, s0;

//Definição da AU
xor xor1(s0, a, b);
not not1(c_n, sel);
xor xor2(s, s0, c_n);

endmodule //au03

// ----------------
// test_lu04
// ----------------
module test_lu04;

// ---------------- Definição de dados
 reg x, y, sel;
 wire s;

// ---------------- Intância
 lu04 modulo(s, x, y, sel);

// ---------------- Preparação
 initial begin: start
  x = 1'b0; y = 1'b0;
  sel = 1'b0;
 end
 
// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0027 - Josemar Alves Caetano - 448662.");
   $display("Test ALU's comparador de igualdade/desigualdade:\n");

   $display("Teste da igualdade:\n");

  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b0; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b0;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);

  #1 $display("\nTeste da desigualdade:\n");
     sel = 1'b1;
     x = 1'b0; y = 1'b0;

  #1 $display("%b = %b ? Resp.: %b", x, y, s);
      x = 1'b0; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b0;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);

 end

endmodule //test_lu04

