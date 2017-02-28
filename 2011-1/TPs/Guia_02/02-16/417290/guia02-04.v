 // -------------------------------
// Guia 02_04 - NOR
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- NOR gate feita de NANDs
// -------------------------------

module norgate (s, p, q);

output s;
input p, q;
wire temp1, temp2, temp3;

nand  NAND1 (temp1, p);
nand  NAND2 (temp2, q);
nand  NAND3 (temp3, temp1, temp2);

assign s = ~(temp3 & temp3);

endmodule // norgate 

// ---------------------
// -- test NOR gate
// ---------------------

module testnorgate;

reg a, b;
wire s;

// instancia

norgate NOR1 (s, a, b);

// parte principal

initial begin

      $display("\nguia02_04 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test NOR gate feita de NANDs\n");
      $display("~(a & b) = s\n");
      $monitor("~(%b & %b) = %b", a, b, s);  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0; 
    #1  a=1; b=1;
  	
	end

endmodule // testnorgate

/* Resultados obtidos

    guia02_04 - Ludmily Caldeira da Silva - 417290
    
    Test NOR gate feita de NANDs
    
    ~(a & b) = s
    
    ~(0 & 0) = 1
    ~(0 & 1) = 0
    ~(1 & 0) = 0
    ~(1 & 1) = 0


*/