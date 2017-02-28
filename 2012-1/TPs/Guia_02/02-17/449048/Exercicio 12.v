// ------------------------- 
// Exemplo0012 
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_02; 
// ------------------------- definir dados 
      reg [2:0] a; 
      reg [3:0] b; 
      reg [4:0] c; 
      reg [4:0] d; 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0012 - Miller - 449048"); 
      $display("Test number system"); 
 
      a =   5; 
      b =  10; 
      c =  15; 
      d =  20; 
       
      $display("\nPositive value"); 
      $display("a = %d = %3b", a, a); 
      $display("b = %d = %4b", a, a); 
      $display("c = %d = %5b", a, a); 
 
      $display("b = %d = %4b", b, b); 
      $display("c = %d = %5b", c, c); 
      $display("d = %d = %5b", d, d); 
      $display("d = %d = %5o", d, d); 
      $display("d = %d = %5h", d, d);
		
		a = -5;
		b = -5;
		c = -5;
		$display("\nNegative value");
		$display("a = -5 [3] = %d = %3b", a, a);
		$display("b = -5 [4] = %d = %4b", b, b);
		$display("c = -5 [5] = %d = %5b", c, c);
		
		end 
 
endmodule // test_base

//-- Variaveis iniciais foram atribuidas a valores negativos, linhas 39, 40 e 41.
//--obs:
//-- %3b = 3 bits para numero binario;
//-- %5o = 5 bits para numero de base octagonal;
//-- %d = exibi valor decimal;
//-- %5h = 5 bits para numero de base hexagonal.

//-- Theldo, nao entendi pq nas linha 43, 44, 45 foi exibido na tela os valores:
//-- 3, 11, 27. Esperava aparecer -5, -5 e -5, nao?