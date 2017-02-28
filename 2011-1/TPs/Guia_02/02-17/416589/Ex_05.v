// ---------------------
// Guia 02_05 - Porta NAND usnando portas NOR
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

module nandgate (s, a, b);
 output s;
 input  a, b;
 wire temp1, temp2,temp3;

 assign temp1 = ~(a | a);
 assign temp2 = ~(b | b);
 assign temp3 = ~(temp1 | temp2);
 assign s = ~(temp3 | temp3);

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a,b;
 wire  s;
          
			 // instancia
 nandgate NAND1 (s,a,b);
 
 initial begin:start
      a=0; b=0;
 end
          // parte principal
 initial begin:main
      $display("Guia 02_05 - Alyson Deives - 416589");
      $display("PORTA NAND (USANDO PORTAS NOR)");
		$display("\nA ^ B = S\n");
      $monitor("%b ^ %b = %b", a, b, s);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
  end

endmodule // testnandgate
