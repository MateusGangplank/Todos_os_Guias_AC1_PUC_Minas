// ---------------------
// Guia 02_03 - Porta NOT usando porta NAND
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- not gate
// ---------------------

module notgate (s, a);
 output s;
 input  a;
 
 assign s = ~(a & a);


endmodule // notgate

// ---------------------
// -- test not gate
// ---------------------

module testnotgate;
 reg   a;
 wire  s;
          
			 // instancia
 notgate NOT1 (s,a);
 
 initial begin:start
      a=0;
 end
          // parte principal
 initial begin:main
      $display("Guia 02_03 - Alyson Deives - 416589");
      $display("PORTA NOT (USANDO PORTA NAND)");
		$display("\nA = S\n");
      $monitor("%b = %b", a,s);
  #1  a=1; 
 end

endmodule // testnotgate
