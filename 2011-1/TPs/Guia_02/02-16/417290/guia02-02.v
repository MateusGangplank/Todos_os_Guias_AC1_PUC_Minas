 // -------------------------------
// Guia 02_02 - AND
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- AND gate feita de NORs
// -------------------------------

module Andgate (s, p, q);

output s;
input p, q;
wire temp1, temp2;

nor NOR1 (temp1, p);
nor NOR2 (temp2, q);
                                 // PODE USAR OUTRA NOR
assign s = ~(temp1 | temp2); 

endmodule // Andgate

// ---------------------
// -- test AND gate
// ---------------------

module testANDgate;

reg a, b;
wire s;

// instancia

Andgate AND1 (s, a, b);

// parte principal

initial begin
      $display("\nguia02_02 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test AND gate feita de NORs");
      $display("\n(a & b) = s\n");
		$monitor ("(%b & %b) = %b", a, b, s);
        a=0; b=0;
    #1  a=0; b=1;
    #1  a=1; b=0;
    #1  a=1; b=1;
  	
end

endmodule //testAndgate

/* Resultados obtidos

    guia02_02 - Ludmily Caldeira da Silva - 417290
    
    Test AND gate feita de NORs
    
    (a & b) = s
    
    (0 & 0) = 0
    (0 & 1) = 0
    (1 & 0) = 0
    (1 & 1) = 1


*/
 