// Exemplo 03
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module subcircuitoMeia (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 
 and AND1 (s1, a, b);
 xor XOR1 (s0, a, b);
 
endmodule

module subcircuitoComp (s0, s1, a, b, c);
 output s0, s1;
 input  a, b, c;
 wire s2, s3, s4;
 
 subcircuitoMeia SUB1 (s2, s3, a, b);
 subcircuitoMeia SUB2 (s0, s4, c, s2);
 or OR1 (s1, s3, s4);
 
endmodule

module circuito (s0, s1, s2, s3, a1, a0, b1, b0);
 output s0, s1, s2, s3;
 input a1, a0, b1, b0;
 wire s4, s5, s6, s7, s8, s9;
 
 and AND1 (s4, a0, b0);
 and AND2 (s5, a0, b1);
 and AND3 (s6, a1, b0);
 and AND4 (s7, a1, b1);
 subcircuitoMeia SUBM1 (s0, s8, 0, s4);
 subcircuitoComp SUBC1 (s1, s9, s8, s5, s6);
 subcircuitoMeia SUBM2 (s2, s3, s9, s7); 

endmodule

module testcircuito;
 reg a1, a0, b1, b0;
 wire s0, s1, s2, s3;
 
 circuito CIRCUITO1 (s0, s1, s2, s3,a1, a0, b1, b0);
 
 initial begin
      $display("Exemplo 03 - Bruno Rafael Nicolletti - 380752");
      $display("Test Circuito Produto de 2 Binarios com 3 bits cada");
      $display("\na1 a0 x b1 b0 = s3 s2 s1 s0");
      $monitor(" %b  %b x  %b  %b =  %b  %b  %b  %b", a1, a0, b1, b0, s3, s2, s1, s0);
	#1 a1=0; a0=0; b1=0; b0=0;
	#1 a1=0; a0=0; b1=0; b0=1;
	#1 a1=0; a0=0; b1=1; b0=0;
	#1 a1=0; a0=0; b1=1; b0=1;
	#1 a1=0; a0=1; b1=0; b0=0;
	#1 a1=0; a0=1; b1=0; b0=1;
	#1 a1=0; a0=1; b1=1; b0=0;
	#1 a1=0; a0=1; b1=1; b0=1;
	#1 a1=1; a0=0; b1=0; b0=0;
	#1 a1=1; a0=0; b1=0; b0=1;
	#1 a1=1; a0=0; b1=1; b0=0;
	#1 a1=1; a0=0; b1=1; b0=1;
	#1 a1=1; a0=1; b1=0; b0=0;
	#1 a1=1; a0=1; b1=0; b0=1;
	#1 a1=1; a0=1; b1=1; b0=0;
	#1 a1=1; a0=1; b1=1; b0=1;
	
  end
 
endmodule

//  a1 a0 x b1 b0 = s3 s2 s1 s0
     x  x x  x  x =  x  x  x  x
     0  0 x  0  0 =  0  0  0  0
     0  0 x  0  1 =  0  0  0  0
     0  0 x  1  0 =  0  0  0  0
     0  0 x  1  1 =  0  0  0  0
     0  1 x  0  0 =  0  0  0  0
     0  1 x  0  1 =  0  0  0  1
     0  1 x  1  0 =  0  0  1  0
     0  1 x  1  1 =  0  0  1  1
     1  0 x  0  0 =  0  0  0  0
     1  0 x  0  1 =  0  0  1  0
     1  0 x  1  0 =  0  1  0  0
     1  0 x  1  1 =  0  1  1  0
     1  1 x  0  0 =  0  0  0  0
     1  1 x  0  1 =  0  0  1  1
     1  1 x  1  0 =  0  1  1  0
     1  1 x  1  1 =  1  0  0  1