 // -------------------------------
// Guia 08_04 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- OR gate feita de NANDs
// -------------------------------

module Orgate (s, a, b, c, d);
 
output s;
input  a, b, c, d;
wire t1, t2, t3, t4;

nand NAND1 (t1, a);
nand NAND2 (t2, b);
nand NAND3 (t3, c);
nand NAND4 (t4, d);
nand NAND5 (s, t1, t2, t3, t4);

endmodule // ORgate

module Andgate3 (s, a, b, c);
 
output s;
input  a, b, c;
wire t1;

nand NAND1 (t1, a, b, c);
nand NAND2 (s, t1);

endmodule // Andgate3

module Andgate2 (s, a, b);
 
output s;
input  a, b;
wire t1;

nand NAND1 (t1, a, b);
nand NAND2 (s, t1);

endmodule // Andgate3


module exercicio1 (s, a, b, c, d);

output s;
input a, b, c, d;
wire temp[0:3];

Andgate3 AND1 (temp[0], a, ~c, d);
Andgate2 AND2 (temp[1], ~a, c);
Andgate2 AND3 (temp[2], b, d);
Andgate2 AND4 (temp[3], b, c);
Orgate OR1 (s, temp[0], temp[1], temp[2], temp[3]);

endmodule //

module testexercicio1;  

wire s;
reg a, b, c, d;

exercicio1 exercicio1 (s, a, b, c, d);

 initial begin
      $display("\nguia08_04 - Ludmily Caldeira da Silva - 417290\n");
      $display("TESTE\n");
      $display("\na   b   c    d    s\n");
      $monitor("%b   %b   %b    %b    %b", a, b, c, d, s);
		
		  a=0; b=0; c=0; d=0;
    #1  a=0; b=0; c=0; d=1;
    #1  a=0; b=0; c=1; d=0;
    #1  a=0; b=0; c=1; d=1;
	 #1  a=0; b=1; c=0; d=0;
    #1  a=0; b=1; c=0; d=1;
    #1  a=0; b=1; c=1; d=0;
    #1  a=0; b=1; c=1; d=1;
    #1  a=1; b=0; c=0; d=0;
    #1  a=1; b=0; c=0; d=1;
    #1  a=1; b=0; c=1; d=0;
	 #1  a=1; b=0; c=1; d=1;
    #1  a=1; b=1; c=0; d=0;
    #1  a=1; b=1; c=0; d=1;
    #1  a=1; b=1; c=1; d=0;
    #1  a=1; b=1; c=1; d=1;  
	    		  
    end
 
endmodule // TestMeiaSoma

/*

RESULTADOS OBTIDOS

    guia08_04 - Ludmily Caldeira da Silva - 417290
    
    TESTE
    
    
    a   b   c    d    s
    
    0   0   0    0    0
    0   0   0    1    0
    0   0   1    0    1
    0   0   1    1    1
    0   1   0    0    0
    0   1   0    1    1
    0   1   1    0    1
    0   1   1    1    1
    1   0   0    0    0
    1   0   0    1    1
    1   0   1    0    0
    1   0   1    1    0
    1   1   0    0    0
    1   1   0    1    1
    1   1   1    0    1
    1   1   1    1    1
    

*/