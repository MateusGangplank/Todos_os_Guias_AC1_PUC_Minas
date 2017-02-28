// Exemplo 03
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module subcircuito (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2;
 
 xor XOR1 (s0, a, b);	
 not NOT1 (s2, a);
 and AND1 (s1, s2, b);
 
endmodule

module circuito (s0, s1, a, b, c);
 output s0, s1;
 input  a, b, c;
 wire s2, s3, s4;
 
 subcircuito SUB1 (s2, s3, a, b);
 subcircuito SUB2 (s0, s4, s2, c);
 or OR1 (s1, s3, s4);
 
endmodule

module testcircuito;
 reg a, b, c;
 wire s0, s1;
 
 circuito CIRCUITO1 (s0, s1, a, b, c);
 
 initial begin
      $display("Exemplo 01 - Bruno Rafael Nicolletti - 380752");
      $display("Test Circuito Diferenca-Completa Com Meia-Diferenca Compacto");
      $display("\na - b - c = s1 s0");
      a=0; b=0; c=0;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
      a=0; b=0; c=1;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
      a=0; b=1; c=0;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
      a=0; b=1; c=1;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
  		a=1; b=0; c=0;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
  		a=1; b=0; c=1;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
  		a=1; b=1; c=0;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
  		a=1; b=1; c=1;
  #1  $display("%b - %b - %b =  %b  %b", a, b, c, s1, s0);
  end
 
endmodule

//  a - b - c = s1 s0
    0 - 0 - 0 =  0  0
    0 - 0 - 1 =  1  1
    0 - 1 - 0 =  1  1
    0 - 1 - 1 =  1  0
    1 - 0 - 0 =  0  1
    1 - 0 - 1 =  0  0
    1 - 1 - 0 =  0  0
    1 - 1 - 1 =  1  1