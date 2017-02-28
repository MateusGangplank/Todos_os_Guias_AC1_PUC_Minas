// Exemplo 02
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module circuito (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2, s3, s4, s5, s6, s7;
 
 nand NAND1 (s2, a, a);
 nand NAND2 (s3, b, b);
 nand NAND3 (s4, s2, s3);
 nand NAND4 (s5, a, b);
 nand NAND5 (s1, s5, s5);
 nand NAND6 (s6, s1, s1);
 nand NAND7 (s7, s6, s4);
 nand NAND8 (s0, s7, s7); 
 
 
endmodule

module testcircuito;
 reg a, b;
 wire s0, s1;
 
 circuito CIRCUITO1 (s0, s1, a, b);
 
 initial begin
      $display("Exemplo 01 - Bruno Rafael Nicolletti - 380752");
      $display("Test Circuito Meia-Soma Tradicional");
      $display("\na + b = s1 s0");
      a=0; b=0;
  #1  $display("%b + %b =  %b  %b", a, b, s1, s0);
      a=0; b=1;
  #1  $display("%b + %b =  %b  %b", a, b, s1, s0);
      a=1; b=0;
  #1  $display("%b + %b =  %b  %b", a, b, s1, s0);
      a=1; b=1;
  #1  $display("%b + %b =  %b  %b", a, b, s1, s0);
  end
 
endmodule

//  a + b = s1 s0
    0 + 0 =  0  0
    0 + 1 =  0  1
    1 + 0 =  0  1
    1 + 1 =  1  0