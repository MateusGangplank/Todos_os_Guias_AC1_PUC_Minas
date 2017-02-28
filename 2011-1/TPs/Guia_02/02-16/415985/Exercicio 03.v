// -----------------------
// Guia 02 - Exercicio 03
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// --- not usando nand ---

// -- module nand gate--

module nandgate (s, p, q);
 output s;
 input p, q;

 assign s = ~(p & q);
 
 endmodule // nandgate
 
// -- module teste not gate--

module testenotgate;
 reg p;
 wire s;
 
 nandgate NAND1 (s, p, p);
 
 // parte principal
  initial begin
      $display("Guia 02 - Exercicio 03");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Teset Not gate using nand");
      $display("\n~p = s\n");
  		p=0; 
	  $monitor("~%b = %b", p, s);
      #1 p=0; 
		#1 p=1; 
		 
	end

endmodule // testenotgate