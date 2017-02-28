module circuito (f, a, b, c, d);
 output f;
 input a, b, c, d;
 wire s0, s1, s2, s3, s4, s5;
 
 not NOT1 (s0, c);
 and AND1 (s1, a, s0, d);
 not NOT2 (s2, a);
 and AND2 (s3, s2, c);
 and AND3 (s4, b, d);
 and AND4 (s5, b, c);
 or OR1 (f, s1, s3, s4, s5);
 
endmodule

module testcircuito;
 reg a, b, c, d;
 wire f;
 
 circuito CIRC1 (f, a, b, c, d);
 
 initial begin
      $display("Exemplo 01 - Braulio Lima e Andrade - 380749");
      $display("Test Circuito Logico para Funcao com Quine-McCluskey");
      $display("\n a  b  c  d =  f");
		$monitor(" %b  %b  %b  %b =  %b", a, b, c, d, f);
	#1 a=0; b=0; c=0; d=0;
	#1 a=0; b=0; c=0; d=1;
	#1 a=0; b=0; c=1; d=0;
	#1 a=0; b=0; c=1; d=1;
	#1 a=0; b=1; c=0; d=0;
	#1 a=0; b=1; c=0; d=1;
	#1 a=0; b=1; c=1; d=0;
	#1 a=0; b=1; c=1; d=1;
	#1 a=1; b=0; c=0; d=0;
	#1 a=1; b=0; c=0; d=1;
	#1 a=1; b=0; c=1; d=0;
	#1 a=1; b=0; c=1; d=1;
	#1 a=1; b=1; c=0; d=0;
	#1 a=1; b=1; c=0; d=1;
	#1 a=1; b=1; c=1; d=0;
	#1 a=1; b=1; c=1; d=1;
	
 end
 
endmodule