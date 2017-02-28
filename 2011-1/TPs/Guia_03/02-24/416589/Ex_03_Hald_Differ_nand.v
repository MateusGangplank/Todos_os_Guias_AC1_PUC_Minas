// ---------------------
// Guia 03_03 - Half Differ with NAND gate
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- half differ with NAND gate
// -------------------------------

module halfdiffer_nand (s0, s1, a, b);
 output s0,s1;
 input  a, b;
 wire temp1;
 
  xor_nand XOR1 (s0,a,b);
  not_nand NOT1(temp1,a);
  and_nand AND1 (s1,temp1,b);

endmodule // halfdiffer_nand

// ---------------------
// -- xor with NAND gate
// ---------------------

module xor_nand (s, a, b);
 output s;
 input  a, b;
 wire temp1,temp2,temp3,temp4;
 
  nand NAND1 (temp1,b,b);
  nand NAND2 (temp3,a,a);
  nand NAND3 (temp2,a,temp1);
  nand NAND4 (temp4,b,temp3);
  nand NAND5 (s, temp2, temp4); 

endmodule // xor_nand

// ---------------------
// -- and with NAND gate
// ---------------------

module and_nand (s, a, b);
 output s;
 input  a, b;
 wire temp1;
 
  nand NAND1 (temp1,a,b);
  nand NAND2 (s,temp1,temp1);

endmodule // and_nand

// ---------------------
// -- not with NAND gate
// ---------------------

module not_nand (s, a);
 output s;
 input  a;
 
  nand NAND1 (s,a,a);
  
endmodule // not_nand


// ---------------------
// -- test halfdiffer_with_nand
// ---------------------

module testhalfdiffer_nand;
 reg   a,b;
 wire  s0,s1;
          
// instancia
 halfdiffer_nand HD1 (s0,s1,a,b);
 
 initial begin:start
      a=0; b=0;
 end
 
 // parte principal
 initial begin:main
      $display("Guia 03_03 - Alyson Deives - 416589");
      $display("HALF DIFFER com portas NAND\n");
		$display("\nA - B = S\n");
      $monitor("%b - %b = %b%b", a, b, s1,s0);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
  end

endmodule // testhalfdiffer_nand