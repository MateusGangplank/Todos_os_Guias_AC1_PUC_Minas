module circuito (s, a);
 output s;
 input  a;
 
 nand NAND1 (s, a, a);
 
endmodule

module testcircuito;
 reg a;
 wire s;
 
 circuito CIRCUITO1 (s, a);
 
 initial begin
 
      $display("Exemplo 03 - Braulio Lima e Andrade - 380749");
      $display("Test Porta NOT constituido por portas NAND");
      $display("\n~a = s");
  		$monitor("~%b = %b", a, s);
  	#1 a=0;
	#1 a=1;
	
  end
 
endmodule
