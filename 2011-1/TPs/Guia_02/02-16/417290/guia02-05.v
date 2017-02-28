 // -------------------------------
// Guia 02_04 - NAND
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- nand gate feita de NORs
// -------------------------------

module Nandgate (s, p, q);

output s;
input p, q;
wire temp1, temp2, temp3;

nor  NOR1 (temp1, p);
nor  NOR2 (temp2, q);
nor  NOR3 (temp3, temp1, temp2);

assign s = ~(temp3 | temp3);

endmodule //nandgate

// ---------------------
// -- test NAND gate
// ---------------------

module testNandgate;

reg a, b;
wire s;

// instancia

Nandgate NAND1 (s, a, b);

// parte principal

initial begin

      $display("\nguia02_05 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test NAND gate feita de NORs\n");
      $display("~(a & b) = s\n");
      $monitor("~(%b & %b) = %b", a, b, s);  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0; 
    #1  a=1; b=1;
  	
	end

endmodule // testNandgate

/* Resultados obtidos

    guia02_05 - Ludmily Caldeira da Silva - 417290
    
    Test NAND gate feita de NORs
    
    ~(a & b) = s
    
    ~(0 & 0) = 1
    ~(0 & 1) = 1
    ~(1 & 0) = 1
    ~(1 & 1) = 0


*/
