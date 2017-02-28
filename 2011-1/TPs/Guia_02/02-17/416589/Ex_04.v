// ---------------------
// Guia 02_04 - Porta NOR usando porta NAND
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

module norgate (s, a,b);
 output s;
 input  a,b;
 wire temp1, temp2,temp3;

 assign temp1 = ~(a & a);
 assign temp2 = ~(b & b);
 assign temp3 = ~(temp1 & temp2);
 assign s = ~(temp3 & temp3);

endmodule // norgate

// ---------------------
// -- test nor gate
// ---------------------

module testnorgate;
 reg   a,b;
 wire  s;
          
			 // instancia
 norgate NOR1 (s,a,b);
 
 initial begin:start
      a=0;b=0;
 end
          // parte principal
 initial begin:main
      $display("Guia 02_04 - Alyson Deives - 416589");
      $display("PORTA NOR (USANDO PORTAS NAND)");
		$display("\n~(A | B) = S\n");
      $monitor("~(%b | %b) = %b", a,b,s);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
 end

endmodule // testnorgate
