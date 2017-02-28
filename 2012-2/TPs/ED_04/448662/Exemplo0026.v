// ---------------
// Exemplo0026 - VERIFICADOR DE IGUALDADE E DIFERENÇA USANDO UM SOMADOR
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 30/08/2012
// ----------------

// ----------------
// AU 03
// ----------------
module au03(output s, input a, input b, input carryIn);

//Definição dos fios do circuito
wire c_n, s0;

//Definição da AU
xor xor1(s0, a, b);
not not1(c_n, carryIn);
xor xor2(s, s0, c_n);

endmodule //au03

// ----------------
// test_au03
// ----------------
module test_au03;

// ---------------- Definição de dados
 reg x, y, carryIn;
 wire s;

// ---------------- Intância
 au03 modulo(s, x, y, carryIn);

// ---------------- Preparação
 initial begin: start
  x = 1'b0; y = 1'b0;
  carryIn = 1'b0;
 end
 
// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0026 - Josemar Alves Caetano - 448662.");
   $display("Test ALU's comparador de igualdade/desigualdade usando somador:\n");

   $display("Teste da igualdade:\n");

  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b0; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b0;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);

  #1 $display("\nTeste da desigualdade:\n");
     carryIn = 1'b1;
     x = 1'b0; y = 1'b0;

  #1 $display("%b = %b ? Resp.: %b", x, y, s);
      x = 1'b0; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b0;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);
     x = 1'b1; y = 1'b1;
  #1 $display("%b = %b ? Resp.: %b", x, y, s);

 end

endmodule //test_au03

