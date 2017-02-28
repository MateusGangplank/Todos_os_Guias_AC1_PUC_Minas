// Guia 05 - Exercicio 02
// Nome: Bruno Cesar Lopes Silva
// Matricula: 415985

module subcircuitoMeia (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2;
 
 xor XOR1 (s0, a, b);	
 not NOT1 (s2, a);
 and AND1 (s1, s2, b);
 
endmodule

module subcircuitoComp (s0, s1, a, b, c);
 output s0, s1;
 input  a, b, c;
 wire s2, s3, s4;
 
 subcircuitoMeia SUB1 (s2, s3, a, b);
 subcircuitoMeia SUB2 (s0, s4, s2, c);
 or OR1 (s1, s3, s4);
 
endmodule

module circuito (s0, s1, s2, a1, a0, b1, b0);
 output s0, s1, s2, s3;
 input a1, a0, b1, b0;
 wire s3;
 
 subcircuitoMeia SUBM1 (s0, s3, a0, b0);
 subcircuitoComp SUBC1 (s1, s2, a1, b1, s3);
 
endmodule

module testcircuito;
 reg a1, a0, b1, b0;
 wire s0, s1, s2;
 
 circuito CIRCUITO1 (s0, s1, s2, a1, a0, b1, b0);
 
 initial begin
      $display("Guia 05 - Exercicio 02");
		$display("Bruno Cesar Lopes Silva");
      $display("Test Circuito Diferenca de 2 Binarios com 2 bits cada");
      $display("\na1 a0 - b1 b0 = s2 s1 s0");
      $monitor(" %b  %b -  %b  %b =  %b  %b  %b", a1, a0, b1, b0, s2, s1, s0);
  #1  a1=0; a0=0; b1=0; b0=0;
  #1  a1=0; a0=0; b1=0; b0=1;
  #1  a1=0; a0=0; b1=1; b0=0;
  #1  a1=0; a0=0; b1=1; b0=1;
  #1  a1=0; a0=1; b1=0; b0=0;
  #1  a1=0; a0=1; b1=0; b0=1;
  #1  a1=0; a0=1; b1=1; b0=0;
  #1  a1=0; a0=1; b1=1; b0=1;
  #1  a1=1; a0=0; b1=0; b0=0;
  #1  a1=1; a0=0; b1=0; b0=1;
  #1  a1=1; a0=0; b1=1; b0=0;
  #1  a1=1; a0=0; b1=1; b0=1;
  #1  a1=1; a0=1; b1=0; b0=0;
  #1  a1=1; a0=1; b1=0; b0=1;
  #1  a1=1; a0=1; b1=1; b0=0;
  #1  a1=1; a0=1; b1=1; b0=1;
  
  end
 
endmodule
 
