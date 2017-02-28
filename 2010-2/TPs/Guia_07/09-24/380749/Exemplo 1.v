module circuito (s0, s1, s2, s3, s4, a3, a2, a1, a0);
 output s0, s1, s2, s3, s4;
 input a3, a2, a1, a0;
 
 not NOT1 (s0, a0);
 not NOT2 (s1, a1);
 not NOT3 (s2, a2);
 not NOT4 (s3, a3);
 
endmodule

module testcircuito;
 reg a3, a2, a1, a0;
 wire s0, s1, s2, s3, s4;
 
 circuito CIRC1 (s0, s1, s2, s3, s4, a3, a2, a1, a0);
 
 initial begin
      $display("Exemplo 01 - Braulio Lima e Andrade - 380749");
      $display("Test Circuito Complemento de 1");
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