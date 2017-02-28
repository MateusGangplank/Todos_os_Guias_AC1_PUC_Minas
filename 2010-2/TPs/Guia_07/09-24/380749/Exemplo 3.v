module subcircuitoMeia (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 
 and AND1 (s1, a, b);
 xor XOR1 (s0, a, b);
 
endmodule

module circuito (s0, s1, s2, s3, s4, a3, a2, a1, a0);
 output s0, s1, s2, s3, s4;
 input a3, a2, a1, a0;
 wire c0, c1, c2;
 
 subcircuitoMeia SUB1 (s0, c0, 1, a0);
 subcircuitoMeia SUB2 (s1, c1, c0, a1);
 subcircuitoMeia SUB3 (s2, c2, c1, a2);
 subcircuitoMeia SUB4 (s3, s4, c2, a3);
 
endmodule

module testcircuito;
 reg a3, a2, a1, a0;
 wire s0, s1, s2, s3, s4;
 
 circuito CIRC1 (s0, s1, s2, s3, s4, a3, a2, a1, a0);
 
 initial begin
      $display("Exemplo 03 - Braulio Lima e Andrade - 380749");
      $display("Test Circuito Incremento de 1");
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