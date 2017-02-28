// -----------------------
// Guia 02 - Exercicio 01
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// -- and gate using nor --

// -- module nor gate--

module norgate(s, p, q);
 output s;
 input p, q;
 
 assign s = ~(p | q);
 
 endmodule // norgate
 
// --module teste and gate --

 module testeandgate;
 reg p, q;
 wire s1, s2, s;
 
 norgate NOR1 (s1, p, p);
 norgate NOR2 (s2, q, q);
 norgate NOR3 (s, s1, s2);
 
 //parte principal
 initial begin
      $display("Guia 02 - Exercicio 02");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Teset And gate using nor");
      $display("\n(p & q) = s\n");
  		p=0; q=0; 
	  $monitor(" %b & %b = %b", p, q, s);
      #1 p=0; q=0;
		#1 p=0; q=1;
		#1 p=1; q=0;
		#1 p=1; q=1;

   
	end

endmodule // testeandgate