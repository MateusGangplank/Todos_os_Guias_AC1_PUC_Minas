// Exemplo 01
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module circuito (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2, s3, s4;
 
 and AND1 (s4, a, b);
 or OR1 (s2, a, b);
 not NOT1 (s3, s4);
 and AND2 (s0, s2, s3);
 and AND1 (s1, a, b);
 
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
/*
    0 + 0 =  0  0
    0 + 1 =  0  1
    1 + 0 =  0  1
    1 + 1 =  1  0
*/

// OBS.: FAVOR NAO DEIXAR ESPACOS EM BRANCO NO NOME DO ARQUIVO.
