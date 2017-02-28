// -----------------------
// Guia 02 - Exercicio 05
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// -- nand gate using nor --

// -- module nor gate --

module norgate(s, p, q);
 output s;
 input p, q;
 
 assign s = ~(p | q);
 
 endmodule // norgate
 
// --module teste nand gate --

 module testenandgate;
  reg p, q;
  wire s1, s2, s3, s;
  
  norgate NOR1 (s1, p, p);
  norgate NOR2 (s2, q, q);
  norgate NOR3 (s3, s1, s2);
  norgate NOR4 (s, s3, s3);
  
  // parte principal
  initial begin
      $display("Guia 02 - Exercicio 05");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Teset Nand gate using nor");
      $display("\n~(p & q) = s\n");
  		p=0; q=0; 
	  $monitor("~(%b & %b) = %b", p, q, s);
      #1 p=0; q=0;
		#1 p=0; q=1;
		#1 p=1; q=0;
		#1 p=1; q=1;

   
	end

endmodule // testenandgate