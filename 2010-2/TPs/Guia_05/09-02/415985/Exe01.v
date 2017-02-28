// Guia 05 - Exercicio 01
// Nome: Bruno Cesar Lopes Silva
// Matricula: 415985

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

module circuito (s0, s1, s2, s3, a2, a1, a0, b2, b1, b0);
 output s0, s1, s2, s3;
 input a2, a1, a0, b2, b1, b0;
 wire s4, s5;
 
 subcircuitoMeia SUBM1 (s0, s4, a0, b0);
 subcircuitoComp SUBC1 (s1, s5, a1, b1, s4);
 subcircuitoComp SUBC2 (s2, s3, a2, b2, s5);

endmodule

module testcircuito;
 reg a2, a1, a0, b2, b1, b0;
 wire s0, s1, s2, s3;
 
 circuito CIRCUITO1 (s0, s1, s2, s3, a2, a1, a0, b2, b1, b0);
 
 initial begin
      $display("Guia 05 - Exercicio 01");
		$display("Bruno César Lopes Silva - 415985");
      $display("Test Circuito Soma de 2 Binarios com 3 bits cada");
      $display("\na2 a1 a0 + b2 b1 b0 = s3 s2 s1 s0");
      $monitor(" %b  %b  %b +  %b  %b  %b =  %b  %b  %b  %b", a2, a1, a0, b2, b1, b0, s3, s2, s1, s0);
	#1 a2=0; a1=0; a0=0; b2=0; b1=0; b0=0;
	#1 a2=0; a1=0; a0=0; b2=0; b1=0; b0=1;
	#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=0;
	#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=1;
	#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=0;
	#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=1;
	#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=0;
	#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=1;
	#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=0;
	#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=0;
	#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=0;
	#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=0;
	#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=0;
	#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=0;
	#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=0;
	#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=1;
	#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=1;
	#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=0;
	#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=0;
	#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=1;
	
  end
 
endmodule

