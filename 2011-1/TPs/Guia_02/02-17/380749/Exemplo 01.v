module circuito (s, a, b);
 output s;
 input  a, b;
 wire s0, s1;
 
 nand NAND1 (s0, a, a);
 nand NAND2 (s1, b, b);
 nand NAND3 (s, s0, s1);
 
endmodule

module testcircuito;
 reg a, b;
 wire s;
 
 circuito CIRCUITO1 (s, a, b);
 
 initial begin
 
      $display("Exemplo 01 - Braulio Lima e Andrade - 380749");
      $display("Test Porta OR constituido por portas NAND");
      $display("\na | b = s");
  		$monitor("%b | %b = %b", a, b, s);
  	#1 a=0; b=0;
	#1 a=0; b=1; 
	#1 a=1; b=0;
	#1 a=1; b=1;
	
  end
 
endmodule

// OBS.: SE POSSIVEL, EVITAR ESPACOS EM BRANCO NO NOME DE ARQUIVO.

