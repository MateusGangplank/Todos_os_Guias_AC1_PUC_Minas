// Exemplo 03
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

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
      $display("Exemplo 03 - Bruno Rafael Nicolletti - 380752");
      $display("Test Porta NOT constituido com portas NAND");
      $display("\n~a = s");
  		$monitor("~%b = %b", a, s);
  	#1 a=0;
	#1 a=1;
  end
 
endmodule

//  ~a = s

    ~0 = 1
    ~1 = 0