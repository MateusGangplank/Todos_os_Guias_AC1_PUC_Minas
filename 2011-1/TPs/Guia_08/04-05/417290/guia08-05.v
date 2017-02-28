 // -------------------------------
// Guia 08_05 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

module Andgate3 (s, a, b, c);

output s;
input a, b, c;
wire temp[0:2];

nor NOR1 (temp[0], a);
nor NOR2 (temp[1], b);
nor NOR3 (temp[2], c);
nor NOR4 (s, temp[0], temp[1], temp[2]);

endmodule //

module Andgate2 (s, a, b);

output s;
input a, b;
wire temp[0:1];

nor NOR1 (temp[0], a);
nor NOR2 (temp[1], b);
nor NOR3 (s, temp[0], temp[1]);

endmodule //

module Orgate (s, a, b, c);

output s;
input a, b, c;
wire t;

nor NOR1 (t, a, b, c);
nor NOR2 (s, t);

endmodule //


module exercicio2 (s, a, b, c, d);

output s;
input a, b, c, d;
wire temp[0:2];

Andgate3 AND1 (temp[0], a, ~b, ~c);
Andgate2 AND2 (temp[1], ~a, ~d);
Andgate2 AND3 (temp[2], a, d);
Orgate OR1 (s, temp[0], temp[1], temp[2]);

endmodule //

module testexercicio2;  

wire s;
reg a, b, c, d;

exercicio2 exercicio2 (s, a, b, c, d);

 initial begin
      $display("\nguia08_05 - Ludmily Caldeira da Silva - 417290\n");
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

    guia08_05 - Ludmily Caldeira da Silva - 417290
    
    TESTE
    
    
    a   b   c    d    s
    
    0   0   0    0    1
    0   0   0    1    0
    0   0   1    0    1
    0   0   1    1    0
    0   1   0    0    1
    0   1   0    1    0
    0   1   1    0    1
    0   1   1    1    0
    1   0   0    0    1
    1   0   0    1    1
    1   0   1    0    0
    1   0   1    1    1
    1   1   0    0    0
    1   1   0    1    1
    1   1   1    0    0
    1   1   1    1    1
*/