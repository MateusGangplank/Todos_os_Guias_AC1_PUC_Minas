// -----------------------
// Guia 02 - Exercicio 04
// Bruno C�sar Lopes Silva
// Matr�cula: 415985
// -----------------------

// --- nor gate usando nand ---

// -- module nand gate--

module nandgate (s, p, q);
 output s;
 input p, q;

 assign s = ~(p & q);
 
 endmodule // nandgate
 
// -- module teste nor gate--

 module testenorgate;
  reg p, q;
  wire s, s1, s2, s3;
  
  nandgate NAND1 (s1, p, p);
  nandgate NAND2 (s2, q, q);
  nandgate NAND3 (s3, s1, s2);
  nandgate NAND4 (s, s3, s3);
  
  // parte principal
  initial begin
      $display("Guia 02 - Exercicio 04");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Teset Nor gate using nand");
      $display("\n~(p | q) = s\n");
  		p=0; q=0; 
	  $monitor("~(%b | %b) = %b", p, q, s);
      #1 p=0; q=0;
		#1 p=0; q=1;
		#1 p=1; q=0;
		#1 p=1; q=1;

   
	end

endmodule // testenorgate