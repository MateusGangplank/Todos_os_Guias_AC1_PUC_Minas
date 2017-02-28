// Exemplo 02
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module circuito (f, a, b, c, d);
 output f;
 input a, b, c, d;
 wire s0, s1, s2, s3, s4, s5, s6, s7, s8;
 
 not NOT1 (s0, a);
 not NOT2 (s1, b);
 not NOT3 (s2, c);
 not NOT4 (s3, d);
 and AND1 (s4, s0, s1, s3);
 and AND2 (s5, s0, s2, s3);
 and AND3 (s6, s1, s2, s3);
 and AND4 (s7, a, s1, d);
 and AND5 (s8, a, s2, d);
 or OR1 (f, s4, s5, s6, s7, s8);
 
endmodule

module testcircuito;
 reg a, b, c, d;
 wire f;
 
 circuito CIRC1 (f, a, b, c, d);
 
 initial begin
      $display("Exemplo 02 - Bruno Rafael Nicolletti - 380752");
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

//   a  b  c  d =  f
     x  x  x  x =  x
     0  0  0  0 =  1
     0  0  0  1 =  0
     0  0  1  0 =  1
     0  0  1  1 =  0
     0  1  0  0 =  1
     0  1  0  1 =  0
     0  1  1  0 =  0
     0  1  1  1 =  0
     1  0  0  0 =  1
     1  0  0  1 =  1
     1  0  1  0 =  0
     1  0  1  1 =  1
     1  1  0  0 =  0
     1  1  0  1 =  1
     1  1  1  0 =  0
     1  1  1  1 =  0