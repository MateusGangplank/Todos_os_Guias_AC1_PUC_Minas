// ------------------------------
// Guia 02 Exercicio 5 - NAND_NOR
// Nome: Marco Antonio M. Belo
// Matricula: 410796
// ------------------------------

// ---------------------------
// -- NOR 
// ---------------------------

module norgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p | q);

endmodule // norgate

// ----------------------------
// -- NOR_NAND
// ----------------------------

module nandgate (s, a, b);
 output s;
 input a, b;
  wire temp1,temp2,temp3;

 norgate NOR1 (temp1, a, a);
 norgate NOR2 (temp2, b, b);
 norgate NOR3 (temp3, temp1, temp2);
 norgate NOR4 (s, temp3, temp3);

endmodule // nandgate


// --------------------------
// -- TEST NOR_NAND
// --------------------------

module testnandgate;
 reg   a, b;             
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 02 Exercicio 5");
		$display("Marco Antonio M. Belo - 410796");
      $display("Test NAND_NOR gate");
      $display("\n ~(a | b) = s\n");
      $monitor(" ~(%b | %b) = %b", a, b, s);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testnorgate