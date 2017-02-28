// Exemplo 02
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

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
      $display("Exemplo 02 - Bruno Rafael Nicolletti - 380752");
      $display("Test Porta AND constituido com portas NOR");
      $display("\na & b = s");
  		$monitor("%b & %b = %b", a, b, s);
  	#1 a=0; b=0;
	#1 a=0; b=1; 
	#1 a=1; b=0;
	#1 a=1; b=1;
  end
 
endmodule

//  a & b = s

    0 & 0 = 0
    0 & 1 = 0
    1 & 0 = 0
    1 & 1 = 1