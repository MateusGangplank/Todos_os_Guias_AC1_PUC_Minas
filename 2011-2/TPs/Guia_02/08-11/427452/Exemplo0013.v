// ------------------------- 
// Exemplo0013 - BASE 
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_03; 
// ------------------------- definir dados 
      reg [2:0] a; 
      reg [3:0] b; 
      reg [4:0] c; 
      reg [4:0] d; 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo 0013 - Pedro Henrique A. M. de Carvalho - 427452"); 
      $display("Test number system"); 
 
      a =  ~5+1; 
      b =  ~5+1; 
      c =  ~5+1;
		d =  -5+1;		// verifico que quando se coloca '-' ao inves de '~' o valor e alterado
      
      $display("\nPositive mixed expression");
      $display("a = %d = %3b", a, a); 
      $display("b = %d = %4b", b, b); 
      $display("c = %d = %5b", c, c);		//obiservei que o resultado foi o mesmo de quando e "-5".
		$display("d = %d = %5b", d, d);		// o valor exibido na tela e de -4
		
 end 
 
endmodule // test_base