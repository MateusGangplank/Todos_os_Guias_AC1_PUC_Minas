 // -------------------------------
// Guia 02_03 - NOT
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- NOT gate feita de NANDs
// -------------------------------

module notgate (s, p);

output s;
input p;

assign s = ~(p & p);

endmodule // notgate

// ---------------------
// -- test NOT gate
// ---------------------

module testnotgate;

reg a;
wire s;

// instancia

notgate NOT1 (s, a);

// parte principal

initial begin
      $display("\nguia02_03 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test NOT gate feita de NAND");
      $display("\n~(a) = s\n");
		$monitor ("~(%b) = %b", a, s);
        a=0; 
    #1  a=1; 
      	
end

endmodule // testnotgate

/*
    
    guia02_03 - Ludmily Caldeira da Silva - 417290
    
    Test NOT gate feita de NAND
    
    ~(a) = s
    
    ~(0) = 1
    ~(1) = 0


*/