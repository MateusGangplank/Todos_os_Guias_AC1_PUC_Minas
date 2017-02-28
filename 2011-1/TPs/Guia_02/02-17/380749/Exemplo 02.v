
module circuito (s, a, b);
 output s;
 input  a, b;
 wire s0, s1;
 
 nor NOR1 (s0, a, a);
 nor NOR2 (s1, b, b);
 nor NOR3 (s, s0, s1);
 
endmodule

module testcircuito;
 reg a, b;
 wire s;
 
 circuito CIRCUITO1 (s, a, b);
 
 initial begin
 
      $display("Exemplo 02 - Braulio Lima e Andrade - 380749");
      $display("Test Porta AND constituido por portas NOR");
      $display("\na & b = s");
  		$monitor("%b & %b = %b", a, b, s);
  	#1 a=0; b=0;
	#1 a=0; b=1; 
	#1 a=1; b=0;
	#1 a=1; b=1;
	
  end
 
endmodule
