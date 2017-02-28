// Exemplo 01
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module circuito (f, a, b, c, d);
 output f;
 input a, b, c, d;
 wire s0, s1, s2, s3, s4, s5;
 
 not NOT1 (s0, d);
 and AND1 (s1, a, b, s0);
 not NOT2 (s2, a);
 and AND2 (s3, s2, c);
 not NOT3 (s4, b);
 and AND3 (s5, s4, c);
 or OR1 (f, s1, s3, s5);
 
endmodule

module testcircuito;
 reg a, b, c, d;
 wire f;
 
 circuito CIRC1 (f, a, b, c, d);
 
 initial begin
      $display("Exemplo 01 - Bruno Rafael Nicolletti - 380752");
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
     0  0  0  0 =  0
     0  0  0  1 =  0
     0  0  1  0 =  1
     0  0  1  1 =  1
     0  1  0  0 =  0
     0  1  0  1 =  0
     0  1  1  0 =  1
     0  1  1  1 =  1
     1  0  0  0 =  0
     1  0  0  1 =  0
     1  0  1  0 =  1
     1  0  1  1 =  1
     1  1  0  0 =  1
     1  1  0  1 =  0
     1  1  1  0 =  1
     1  1  1  1 =  0