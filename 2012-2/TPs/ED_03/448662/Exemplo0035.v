// ---------------
// Exemplo0035 - F4 - LU 05
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 22/08/2012
// ----------------

// ----------------
// LU 05
// ----------------
module lu05(output saida, input a, input b,
            input chaveb2,  //Chave mais � esquerda do bit   //PROFESSOR: N�o consegui colocar os tr�s bits em uma �nica chave.
            input chaveb1,  //Chave do meio do bit
            input chaveb0); //Chave � direita do bit

//Declara��o dos fios do circuito
wire s0, s1, s2, s3, s4, s5, s6, s7,  //Sa�das das portas de opera��es
     c2_b, c2_n, c1_b, c1_n, c0_b, c0_n, //Chaveamento bufferizado ou negado
     d0, d1, d2, d3, d4, d5, d6, d7;  //Tomada de decis�es do circuito

//Defini��o das opera��es da LU
not not1(s0, a);
not not2(s1, b);
or or1(s2, a, b);
nor nor1(s3, a, b);
and and1(s4, a, b);
nand nand1(s5, a, b);
xor xor1(s6, a, b);
xnor xnor1(s7, a, b);

//Defini��o da LU
not not1(c2_n, chaveb2);
not not2(c1_n, chaveb1);
not not3(c0_n, chaveb0);
buf buf1(c2_b, chaveb2);
buf buf2(c1_b, chaveb1);
buf buf2(c0_b, chaveb0);
and and2(d0, s0, c2_n, c1_n, c0_n); //Representa a opera��o NOT(a)
and and3(d1, s1, c2_n, c1_n, c0_b); //Representa a opera��o NOT(b)
and and4(d2, s2, c2_n, c1_b, c0_n); //Representa a opera��o OR
and and5(d3, s3, c2_n, c1_b, c0_b); //Representa a opera��o NOR
and and6(d4, s4, c2_b, c1_n, c0_n); //Representa a opera��o AND
and and7(d5, s5, c2_b, c1_n, c0_b); //Representa a opera��o NAND
and and8(d6, s6, c2_b, c1_b, c0_n); //Representa a opera��o XOR
and and9(d7, s7, c2_b, c1_b, c0_b); //Representa a opera��o XNOR
or or2(saida, d0, d1, d2, d3, d4, d5, d6, d7);

endmodule// lu04

// ----------------
// f4
// ----------------
module f4(output s, input a, input b, input chaveb2, input chaveb1, input chaveb0);

//Inst�ncia a LU
lu05 l1(s, a, b, chaveb2, chaveb1, chaveb0);

endmodule

// ----------------
// test f4
// ----------------
module test_f4;

// ---------------- Defini��o de vari�veis
reg x, y;
wire z;
reg chaveb2, chaveb1, chaveb0;
     
// ---------------- Inst�ncia
f4 modulo(z, x, y, chaveb2, chaveb1, chaveb0);

// ---------------- Prepara��o
 initial begin: start
   x = 1'b0; y = 1'b0;
   chaveb2 = 1'b0;
   chaveb1 = 1'b0;
   chaveb0 = 1'b0;
 end

// ----------------- Parte principal
 initial begin: main
    $display("Exemplo0035 - Josemar Alves Caetano - 448662");
    $display("Test LU's module");

   // Projetar testes do modulo
	
  #1 $display("\nTeste de opera��es:\n");
     $display("NOT(a):\n");
     $display("~%b = %b", x, z);
     x = 1'b1;

  #1 $display("~%b = %b", x, z);
     y = 1'b0;
     chaveb2 = 1'b0;
     chaveb1 = 1'b0;
     chaveb0 = 1'b1;

  #1 $display("NOT(b):\n");
     $display("~%b = %b", y, z);
     y = 1'b1;

  #1 $display("~%b = %b", y, z);
     x = 1'b0; y = 1'b0;
     chaveb2 = 1'b0;
     chaveb1 = 1'b1;
     chaveb0 = 1'b0;

  #1 $display("OR:\n");
     $display("%b | %b = %b", x, y, z);
     x = 1'b0; y = 1'b1;

  #1 $display("%b | %b = %b", x, y, z);
     x = 1'b1; y = 1'b0;

  #1 $display("%b | %b = %b", x, y, z);
     x = 1'b1; y = 1'b1;
  
  #1 $display("%b | %b = %b", x, y, z);
     x = 1'b0; y = 1'b0;
     chaveb2 = 1'b0;
     chaveb1 = 1'b1;
     chaveb0 = 1'b1;

  #1$display("\nNOR:\n");
     $display("~%b & ~%b = %b", x, y, z);
     x = 1'b0; y = 1'b1;
  
  #1 $display("~%b & ~%b = %b", x, y, z);
     x = 1'b1; y = 1'b0;
  
  #1 $display("~%b & ~%b = %b", x, y, z);
     x = 1'b1; y = 1'b1;

  #1 $display("~%b & ~%b = %b", x, y, z);
     x = 1'b0; y = 1'b0;
     chaveb2 = 1'b1;
     chaveb1 = 1'b0;
     chaveb0 = 1'b0;
     
  #1 $display("AND:\n");
     $display("%b & %b = %b", x, y, z);
     x = 1'b0; y = 1'b1;

  #1 $display("%b & %b = %b", x, y, z);
     x = 1'b1; y = 1'b0;

  #1 $display("%b & %b = %b", x, y, z);
     x = 1'b1; y = 1'b1;
  
  #1 $display("%b & %b = %b", x, y, z);
     x = 1'b0; y = 1'b0;
     chaveb2 = 1'b1;
     chaveb1 = 1'b0;
     chaveb0 = 1'b1;

  #1$display("\nNAND:\n");
     $display("~%b | ~%b = %b", x, y, z);
     x = 1'b0; y = 1'b1;

  #1 $display("~%b | ~%b = %b", x, y, z);
     x = 1'b1; y = 1'b0;

  #1 $display("~%b | ~%b = %b", x, y, z);
     x = 1'b1; y = 1'b1;

  #1 $display("~%b | ~%b = %b", x, y, z);
     x = 1'b0; y = 1'b0;
     chaveb2 = 1'b1;
     chaveb1 = 1'b1;
     chaveb0 = 1'b0;

  #1$display("\nXOR:\n");
     $display("%b ^ %b = %b", x, y, z);
     x = 1'b0; y = 1'b1;

  #1 $display("%b ^ %b = %b", x, y, z);
     x = 1'b1; y = 1'b0;
  
  #1 $display("%b ^ %b = %b", x, y, z);
     x = 1'b1; y = 1'b1;

  #1 $display("%b ^ %b = %b", x, y, z);
     x = 1'b0; y = 1'b0;
     chaveb2 = 1'b1;
     chaveb1 = 1'b1;
     chaveb0 = 1'b1;
  
  #1$display("\nXNOR:\n");
     $display("%b ~^ %b = %b", x, y, z);
     x = 1'b0; y = 1'b1;

  #1 $display("%b ~^ %b = %b", x, y, z);
     x = 1'b1; y = 1'b0;
  
  #1 $display("%b ~^ %b = %b", x, y, z);
     x = 1'b1; y = 1'b1;

  #1 $display("%b ~^ %b = %b", x, y, z);

 end

endmodule //test_f4








