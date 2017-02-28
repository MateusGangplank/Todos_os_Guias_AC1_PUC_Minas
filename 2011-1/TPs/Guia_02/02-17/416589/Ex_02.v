// ---------------------
// Guia 02_02 - Porta AND usando portas NOR
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (s, a, b);
 output s;
 input  a, b;
 wire temp1, temp2;

 assign temp1 = ~(a | a);
 assign temp2 = ~(b | b);
 assign s = ~(temp1 | temp2);


endmodule // andgate

// ---------------------
// -- test and gate
// ---------------------

module testandgate;
 reg   a,b;
 wire  s;
          
			 // instancia
 andgate AND1 (s,a,b);
 
 initial begin:start
      a=0; b=0;
 end
          // parte principal
 initial begin:main
      $display("Guia 02_02 - Alyson Deives - 416589");
      $display("PORTA AND (USANDO PORTAS NOR)");
		$display("\nA ^ B = S\n");
      $monitor("%b ^ %b = %b", a, b, s);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
  end

endmodule // testandgate
