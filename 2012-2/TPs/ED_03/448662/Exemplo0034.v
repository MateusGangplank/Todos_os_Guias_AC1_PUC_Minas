// ---------------
// Exemplo0034 - F4 - LU 04
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 22/08/2012
// ----------------

// ----------------
// LU 04
// ----------------
module lu04(output saida, input a, input b, 
            input chaveb1,  //Chave � esquerda do bit   //PROFESSOR: N�o consegui colocar os dois bits em uma �nica chave.
            input chaveb0); //Chave � direita do bit

//Declara��o dos fios do circuito
wire s0, s1, s2, s3, c0_b, c0_n, c1_b, c1_n, d0, d1, d2, d3;

//Defini��o das opera��es da LU
or or1(s0, a, b);
nor nor1(s1, a, b);
xor xor1(s2, a, b);
xnor xnor1(s3, a, b);

//Defini��o da LU
not not1(c1_n, chaveb1);
not not2(c0_n, chaveb0);
buf buf1(c1_b, chaveb1);
buf buf2(c0_b, chaveb0);
and and1(d0, s0, c1_n, c0_n); //Representa a opera��o AND
and and2(d1, s1, c1_n, c0_b); //Representa a opera��o NAND
and and3(d2, s2, c1_b, c0_n); //Representa a opera��o OR
and and4(d3, s3, c1_b, c0_b); //Representa a opera��o NOR
or or2(saida, d0, d1, d2, d3);

endmodule// lu04

// ----------------
// f4
// ----------------
module f4(output s, input a, input b, input chaveb1, input chaveb0);

//Inst�ncia a LU
lu04 l1(s, a, b, chaveb1, chaveb0);

endmodule

// ----------------
// test f4
// ----------------
module test_f4;

// ---------------- Defini��o de vari�veis
reg x, y;
wire z;
reg chaveb1, chaveb0;
     
// ---------------- Inst�ncia
f4 modulo(z, x, y, chaveb1, chaveb0);

// ---------------- Prepara��o
 initial begin: start
   x = 1'b0; y = 1'b0;
   chaveb1 = 1'b0;
   chaveb0 = 1'b0;
 end
 
// ----------------- Parte principal
 initial begin: main
    $display("Exemplo0034 - Josemar Alves Caetano - 448662");
    $display("Test LU's module");

   // Projetar testes do modulo
	
  #1 $display("\nTeste de opera��es:\n");
     $display("OR:\n");
     $display("%b | %b = %b", x, y, z);
     x = 1'b0; y = 1'b1;

  #1 $display("%b | %b = %b", x, y, z);
     x = 1'b1; y = 1'b0;

  #1 $display("%b | %b = %b", x, y, z);
     x = 1'b1; y = 1'b1;
  
  #1 $display("%b | %b = %b", x, y, z);
     x = 1'b0; y = 1'b0;
     chaveb1 = 1'b0;
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








