// Exemplo 02
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module subcircuito (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 
 and AND1 (s1, a, b);
 xor XOR1 (s0, a, b);
 
endmodule

module circuito (s0, s1, a, b, c);
 output s0, s1;
 input  a, b, c;
 wire s2, s3, s4;
 
 subcircuito SUB1 (s2, s3, a, b);
 subcircuito SUB2 (s0, s4, c, s2);
 or OR1 (s1, s3, s4);
 
endmodule

module testcircuito;
 reg a, b, c;
 wire s0, s1;
 
 circuito CIRCUITO1 (s0, s1, a, b, c);
 
 initial begin
      $display("Exemplo 01 - Bruno Rafael Nicolletti - 380752");
      $display("Test Circuito Soma-Completa Com Meia-Soma Compacto");
      $display("\nc + a + b = s1 s0");
      c=0; a=0; b=0;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
      c=0; a=0; b=1;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
      c=0; a=1; b=0;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
      c=0; a=1; b=1;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
  		c=1; a=0; b=0;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
  		c=1; a=0; b=1;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
  		c=1; a=1; b=0;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
  		c=1; a=1; b=1;
  #1  $display("%b + %b + %b =  %b  %b", c, a, b, s1, s0);
  end
 
endmodule

//  c + a + b = s1 s0
    0 + 0 + 0 =  0  0
    0 + 0 + 1 =  0  1
    0 + 1 + 0 =  0  1
    0 + 1 + 1 =  1  0
    1 + 0 + 0 =  0  1
    1 + 0 + 1 =  1  0
    1 + 1 + 0 =  1  0
    1 + 1 + 1 =  1  1