 // -------------------------------
// Guia 08_03b 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

module exercicio2 (s, a, b, c, d, e);

output s;
input a, b, c, d, e;
wire temp[0:2];

or OR1 (temp[0], a, b, c, d);
or OR2 (temp[1], ~a, ~c, ~d, e);
or OR3 (temp[2], ~a, ~b, c);
and AND1 (s, temp[0], temp[1], temp[2]);

endmodule //

module testexercicio2;  

wire s;
reg a, b, c, d, e;

exercicio2 exercicio2 (s, a, b, c, d, e);

 initial begin
      $display("\nguia08_03b - Ludmily Caldeira da Silva - 417290\n");
      $display("TESTE\n");
      $display("\na   b   c    d    e    s\n");
      $monitor("%b   %b   %b    %b    %b    %b", a, b, c, d, e, s);
		
	     a=0; b=0; c=0; d=0; e=0;
    #1  a=0; b=0; c=0; d=0; e=1;
    #1  a=0; b=0; c=0; d=1; e=0;
    #1  a=0; b=0; c=0; d=1; e=1;
    #1  a=0; b=0; c=1; d=0; e=0;
    #1  a=0; b=0; c=1; d=0; e=1;
    #1  a=0; b=0; c=1; d=1; e=0;
    #1  a=0; b=0; c=1; d=1; e=1;
    #1  a=0; b=1; c=0; d=0; e=0;
    #1  a=0; b=1; c=0; d=0; e=1;
    #1  a=0; b=1; c=0; d=1; e=0;
    #1  a=0; b=1; c=0; d=1; e=1;
    #1  a=0; b=1; c=1; d=0; e=0;
    #1  a=0; b=1; c=1; d=0; e=1;
    #1  a=0; b=1; c=1; d=1; e=0;
    #1  a=0; b=1; c=1; d=1; e=1;  
    #1  a=1; b=0; c=0; d=0; e=0;
    #1  a=1; b=0; c=0; d=0; e=1;
    #1  a=1; b=0; c=0; d=1; e=0;
    #1  a=1; b=0; c=0; d=1; e=1;
    #1  a=1; b=0; c=1; d=0; e=0;
    #1  a=1; b=0; c=1; d=0; e=1;
    #1  a=1; b=0; c=1; d=1; e=0;
    #1  a=1; b=0; c=1; d=1; e=1;
    #1  a=1; b=1; c=0; d=0; e=0;
    #1  a=1; b=1; c=0; d=0; e=1;
    #1  a=1; b=1; c=0; d=1; e=0;
    #1  a=1; b=1; c=0; d=1; e=1;
    #1  a=1; b=1; c=1; d=0; e=0;
    #1  a=1; b=1; c=1; d=0; e=1;
    #1  a=1; b=1; c=1; d=1; e=0;
    #1  a=1; b=1; c=1; d=1; e=1;      
	  
    end
 
endmodule // TestMeiaSoma

/*

RESULTADOS OBTIDOS

     guia08_03b - Ludmily Caldeira da Silva - 417290
    
    TESTE
    
    
    a   b   c    d    e    s
    
    0   0   0    0    0    0
    0   0   0    0    1    0
    0   0   0    1    0    1
    0   0   0    1    1    1
    0   0   1    0    0    1
    0   0   1    0    1    1
    0   0   1    1    0    1
    0   0   1    1    1    1
    0   1   0    0    0    1
    0   1   0    0    1    1
    0   1   0    1    0    1
    0   1   0    1    1    1
    0   1   1    0    0    1
    0   1   1    0    1    1
    0   1   1    1    0    1
    0   1   1    1    1    1
    1   0   0    0    0    1
    1   0   0    0    1    1
    1   0   0    1    0    1
    1   0   0    1    1    1
    1   0   1    0    0    1
    1   0   1    0    1    1
    1   0   1    1    0    0
    1   0   1    1    1    1
    1   1   0    0    0    0
    1   1   0    0    1    0
    1   1   0    1    0    0
    1   1   0    1    1    0
    1   1   1    0    0    1
    1   1   1    0    1    1
    1   1   1    1    0    0
    1   1   1    1    1    1
*/