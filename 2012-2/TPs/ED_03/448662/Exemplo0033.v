// ---------------
// Exemplo0033 - F4 - LU 03
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 22/08/2012
// ----------------

// ----------------
// LU 03
// ----------------
module lu03(output saida0, output saida1, input a, input b, input chave);

//Declara��o dos fios do circuito
wire s0, s1, s2, s3, c0, c1, d0, d1, d2, d3;

//Defini��o das opera��es da LU
and and1(s0, a, b);
nand nand1(s1, a, b);
or or1(s2, a, b);
nor nor1(s3, a, b);

//Defini��o da LU
not not1(c0, chave);
buf buf1(c1, chave);
and and2(d0, s0, c0); //Representa a opera��o AND
and and3(d1, s1, c1); //Representa a opera��o NAND
and and4(d2, s2, c0); //Representa a opera��o OR
and and5(d3, s3, c1); //Representa a opera��o NOR
or or2(saida0, d0, d1);
or or3(saida1, d2, d3);

endmodule// lu03

// ----------------
// f4
// ----------------
module f4(output s0, output s1, input a, input b, input chave);

//Inst�ncia a LU
lu03 l1(s0, s1, a, b, chave);

endmodule

// ----------------
// test f4
// ----------------
module test_f4;

// ---------------- Defini��o de vari�veis
reg x, y;
wire z0, z1;
reg chave;
     
// ---------------- Inst�ncia
f4 modulo(z0, z1, x, y, chave);

// ---------------- Prepara��o
 initial begin: start
   x = 1'b0; y = 1'b0;
   chave = 1'b0;
 end
 
// ----------------- Parte principal
 initial begin: main
    $display("Exemplo0033 - Josemar Alves Caetano - 448662");
    $display("Test LU's module");

   // Projetar testes do modulo
	
  #1 $display("\nTeste de opera��es:\n");
     $display("AND       -     OR:\n");
     $display("%b & %b = %b  -  %b | %b = %b", x, y, z0, x, y, z1);
     x = 1'b0; y = 1'b1;

  #1 $display("%b & %b = %b  -  %b | %b = %b", x, y, z0, x, y, z1);
     x = 1'b1; y = 1'b0;
  
  #1 $display("%b & %b = %b  -  %b | %b = %b", x, y, z0, x, y, z1);
     x = 1'b1; y = 1'b1;
  
  #1 $display("%b & %b = %b  -  %b | %b = %b", x, y, z0, x, y, z1);
     x = 1'b0; y = 1'b0;
     chave = 1'b1;
  
  #1$display("\nNAND       -      NOR:\n");
     $display("~%b | ~%b = %b  -  ~%b & ~%b = %b", x, y, z0, x, y, z1);
     x = 1'b0; y = 1'b1;
  
  #1 $display("~%b | ~%b = %b  -  ~%b & ~%b = %b", x, y, z0, x, y, z1);
     x = 1'b1; y = 1'b0;
  
  #1 $display("~%b | ~%b = %b  -  ~%b & ~%b = %b", x, y, z0, x, y, z1);
     x = 1'b1; y = 1'b1;

  #1 $display("~%b | ~%b = %b  -  ~%b & ~%b = %b", x, y, z0, x, y, z1);
  
 end

endmodule //test_f4








