
module circuito (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2, s3, s4, s5, s6, s7, s8;

 nor NOR1 (s2, a, b);
 nor NOR2 (s3, s2, s2);
 nor NOR3 (s4, a, a);
 nor NOR4 (s5, b, b);
 nor NOR5 (s1, s4, s5);
 nor NOR6 (s6, s1, s1);
 nor NOR7 (s7, s6, s6);
 nor NOR8 (s8, s3, s3);
 nor NOR9 (s0, s7, s8);

endmodule

module testcircuito;
 reg a, b;
 wire s0, s1;

 circuito CIRCUITO1 (s0, s1, a, b);

 initial begin
      $display("Exemplo 01 - Braulio Lima e Andrade - 380749");
      $display("Test Circuito Meia-Soma");
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

// OBS.: FAVOR NAO DEIXAR ESPACO EM BRANCO NO NOME DE ARQUIVO.
