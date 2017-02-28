module circuito (f, a, b, c, d, e);
 output f;
 input a, b, c, d, e;
 wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;
 
 not NOT1 (s0, a);
 not NOT2 (s1, b);
 not NOT3 (s2, c);
 not NOT4 (s3, d);
 not NOT5 (s4, e);
 and AND1 (s5, a, s1, s2, d, s4);
 and AND2 (s6, a, b, d, e);
 and AND3 (s7, s0, s2, s3);
 and AND4 (s8, s1, s3, e);
 and AND5 (s9, s1, c, s3);
 and AND6 (s10, b, c, d);
 and AND7 (s11, c, e);
 or OR1 (f, s5, s6, s7, s8, s9, s10, s11);
 
endmodule

module testcircuito;
 reg a, b, c, d, e;
 wire f;
 
 circuito CIRC1 (f, a, b, c, d, e);
 
 initial begin
      $display("Exemplo 03 - Braulio Lima e Andrade - 380749");
      $display("Test Circuito Logico para Funcao com Quine-McCluskey");
      $display("\n a  b  c  d  e =  f");
		$monitor(" %b  %b  %b  %b  %b =  %b", a, b, c, d, e, f);
	#1 a=0; b=0; c=0; d=0; e=0;
	#1 a=0; b=0; c=0; d=0; e=1;
	#1 a=0; b=0; c=0; d=1; e=0;
	#1 a=0; b=0; c=0; d=1; e=1;
	#1 a=0; b=0; c=1; d=0; e=0;
	#1 a=0; b=0; c=1; d=0; e=1;
	#1 a=0; b=0; c=1; d=1; e=0;
	#1 a=0; b=0; c=1; d=1; e=1;
	#1 a=0; b=1; c=0; d=0; e=0;
	#1 a=0; b=1; c=0; d=0; e=1;
	#1 a=0; b=1; c=0; d=1; e=0;
	#1 a=0; b=1; c=0; d=1; e=1;
	#1 a=0; b=1; c=1; d=0; e=0;
	#1 a=0; b=1; c=1; d=0; e=1;
	#1 a=0; b=1; c=1; d=1; e=0;
	#1 a=0; b=1; c=1; d=1; e=1;
	#1 a=1; b=0; c=0; d=0; e=0;
	#1 a=1; b=0; c=0; d=0; e=1;
	#1 a=1; b=0; c=0; d=1; e=0;
	#1 a=1; b=0; c=0; d=1; e=1;
	#1 a=1; b=0; c=1; d=0; e=0;
	#1 a=1; b=0; c=1; d=0; e=1;
	#1 a=1; b=0; c=1; d=1; e=0;
	#1 a=1; b=0; c=1; d=1; e=1;
	#1 a=1; b=1; c=0; d=0; e=0;
	#1 a=1; b=1; c=0; d=0; e=1;
	#1 a=1; b=1; c=0; d=1; e=0;
	#1 a=1; b=1; c=0; d=1; e=1;
	#1 a=1; b=1; c=1; d=0; e=0;
	#1 a=1; b=1; c=1; d=0; e=1;
	#1 a=1; b=1; c=1; d=1; e=0;
	#1 a=1; b=1; c=1; d=1; e=1;
	
 end
 
endmodule