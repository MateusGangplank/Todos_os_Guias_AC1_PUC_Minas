// Exemplo 03
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module circuito (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2, s3, s4, s5, s6;
 
 nand NAND1 (s2, a, b);
 nand NAND2 (s3, s2, a);
 nand NAND3 (s4, s2, b);
 nand NAND4 (s0, s3, s4);
 nand NAND5 (s5, a, a);
 nand NAND6 (s6, s5, b);
 nand NAND7 (s1, s6, s6);
 
endmodule

module testcircuito;
 reg a, b;
 wire s0, s1;
 
 circuito CIRCUITO1 (s0, s1, a, b);
 
 initial begin
      $display("Exemplo 01 - Bruno Rafael Nicolletti - 380752");
      $display("Test Circuito Meia-Diferenca Compacto com Portas NAND");
      $display("\na - b = s1 s0");
      a=0; b=0;
  #1  $display("%b - %b =  %b  %b", a, b, s1, s0);
      a=0; b=1;
  #1  $display("%b - %b =  %b  %b", a, b, s1, s0);
      a=1; b=0;
  #1  $display("%b - %b =  %b  %b", a, b, s1, s0);
      a=1; b=1;
  #1  $display("%b - %b =  %b  %b", a, b, s1, s0);
  end
 
endmodule 

//  a - b = s1 s0
    0 - 0 =  0  0
    0 - 1 =  1  1
    1 - 0 =  0  1
    1 - 1 =  0  0