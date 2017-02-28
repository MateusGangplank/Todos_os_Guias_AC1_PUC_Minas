// ---------------------------
// Guia_03 - Exercicio 2
// Nome: Marco Antonio M. Belo
// Matricula: 0410796
// ---------------------------


// ---------------------
// -- or_nand gate
// ---------------------

module or_nand_gate (s, p, q);
 output s;
 input  p,q;
 wire temp1, temp2;
 
 nand NAND1(temp1, p, p);
 nand NAND2(temp2, q, q);
 nand NAND3(s, temp1, temp2);
 
endmodule 

// ---------------------
// -- and_nand gate
// ---------------------

module and_nand_gate (s, p, q);
 output s;
 input  p,q;
 wire temp1, temp2;
 
 nand NAND1(temp1, p, q);
 nand NAND2(temp2, q, p);
 nand NAND3(s, temp1, temp2);

endmodule 

// ---------------------
// -- not_nand gate
// ---------------------

module not_nand_gate (s, p);
 output s;
 input  p;
 
 nand NAND1(s, p, p);

endmodule 

// ---------------------
// -- half adder
// ---------------------

module half_adder (s0, s1, p, q);
 output s0, s1;
 input  p,q;
 wire temp1, temp2;
 
 or_nand_gate OR_NAND1(temp1, p, q);
 and_nand_gate AND_NAND1(s1, p, q); 
 not_nand_gate NOT_NAND1(temp2, s1);
 and_nand_gate AND_NAND2(s0, temp2,temp1);
 
endmodule 

// ---------------------
// -- test half adder
// ---------------------

module meiasoma;
 reg   a, b;
 wire  s0, s1;
          // instancia
 half_adder HA1(s1, s0, a, b);
 
 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Exercico 2 - GUIA 03\nMarco Antonio M. Belo - 0410796\n");
      $display("Meia Soma");
      $display("\na + b = s\n");
      $monitor("%b + %b = %b%b", a, b, s0, s1);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;

 end
endmodule // testxorgate