// Exemplo 02
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module subcircuitoMeia (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 
 and AND1 (s1, a, b);
 xor XOR1 (s0, a, b);
 
endmodule

module circuito (s0, s1, s2, s3, s4, a3, a2, a1, a0);
 output s0, s1, s2, s3, s4;
 input a3, a2, a1, a0;
 wire x0, x1, x2, x3, c0, c1, c2;
 
 not NOT1 (x0, a0);
 not NOT2 (x1, a1);
 not NOT3 (x2, a2);
 not NOT4 (x3, a3);
 subcircuitoMeia SUB1 (s0, c0, 1, x0);
 subcircuitoMeia SUB2 (s1, c1, c0, x1);
 subcircuitoMeia SUB3 (s2, c2, c1, x2);
 subcircuitoMeia SUB4 (s3, s4, c2, x3);
 
endmodule

module testcircuito;
 reg a3, a2, a1, a0;
 wire s0, s1, s2, s3, s4;
 
 circuito CIRC1 (s0, s1, s2, s3, s4, a3, a2, a1, a0);
 
 initial begin
      $display("Exemplo 02 - Bruno Rafael Nicolletti - 380752");
      $display("Test Circuito Complemento de 2");
      $display("\na3 a2 a1 a0 = s3 s2 s1 s0");
		$monitor(" %b  %b  %b  %b =  %b  %b  %b  %b", a3, a2, a1, a0, s3, s2, s1, s0);
	#1 a3=0; a2=0; a1=0; a0=0;
	#1 a3=0; a2=0; a1=0; a0=1;
	#1 a3=0; a2=0; a1=1; a0=0;
	#1 a3=0; a2=0; a1=1; a0=1;
	#1 a3=0; a2=1; a1=0; a0=0;
	#1 a3=0; a2=1; a1=0; a0=1;
	#1 a3=0; a2=1; a1=1; a0=0;
	#1 a3=0; a2=1; a1=1; a0=1;
	#1 a3=1; a2=0; a1=0; a0=0;
	#1 a3=1; a2=0; a1=0; a0=1;
	#1 a3=1; a2=0; a1=1; a0=0;
	#1 a3=1; a2=0; a1=1; a0=1;
	#1 a3=1; a2=1; a1=0; a0=0;
	#1 a3=1; a2=1; a1=0; a0=1;
	#1 a3=1; a2=1; a1=1; a0=0;
	#1 a3=1; a2=1; a1=1; a0=1;
	
 end
 
endmodule

//  a3 a2 a1 a0 = s3 s2 s1 s0
     x  x  x  x =  x  x  x  x
     0  0  0  0 =  0  0  0  0
     0  0  0  1 =  1  1  1  1
     0  0  1  0 =  1  1  1  0
     0  0  1  1 =  1  1  0  1
     0  1  0  0 =  1  1  0  0
     0  1  0  1 =  1  0  1  1
     0  1  1  0 =  1  0  1  0
     0  1  1  1 =  1  0  0  1
     1  0  0  0 =  1  0  0  0
     1  0  0  1 =  0  1  1  1
     1  0  1  0 =  0  1  1  0
     1  0  1  1 =  0  1  0  1
     1  1  0  0 =  0  1  0  0
     1  1  0  1 =  0  0  1  1
     1  1  1  0 =  0  0  1  0
     1  1  1  1 =  0  0  0  1	