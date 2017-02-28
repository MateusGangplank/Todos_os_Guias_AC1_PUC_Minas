// ------------------------------
// Guia 02 Exercicio 4 - NOR_NAND
// Nome: Marco Antonio M. Belo
// Matricula: 410796
// ------------------------------

// ---------------------------
// -- NAND 
// ---------------------------

module nandgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p & q);

endmodule // nandgate


// ----------------------------
// -- NOR_NAND
// ----------------------------

module norgate (s, a, b);
 output s;
 input a, b;
  wire temp1,temp2,temp3;

 nandgate NAND1 (temp1, a, a);
 nandgate NAND2 (temp2, b, b);
 nandgate NAND3 (temp3, temp1, temp2);
 nandgate NAND4 (s, temp3, temp3);

endmodule // norgate


// --------------------------
// -- TEST NOR_NAND
// --------------------------

module testnorgate;
 reg   a, b;             
 wire  s;
          // instancia
 norgate NOR1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 02 Exercicio 4");
		$display("Marco Antonio M. Belo - 410796");
      $display("Test NOR_NAND gate");
      $display("\n ~(a & b) = s\n");
      $monitor(" ~(%b & %b) = %b", a, b, s);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testnorgate