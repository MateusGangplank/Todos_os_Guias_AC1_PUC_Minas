 // -------------------------------
// Guia 08_02 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

module exercicio2 (s, a, b, c, d);

output s;
input a, b, c, d;
wire temp[0:2];

and AND1 (temp[0], a, ~b, ~c);
and AND2 (temp[1], ~a, ~d);
and AND3 (temp[2], a, d);
or OR1 (s, temp[0], temp[1], temp[2]);

endmodule //

module testexercicio2;  

wire s;
reg a, b, c, d;

exercicio2 exercicio2 (s, a, b, c, d);

 initial begin
      $display("\nguia08_02 - Ludmily Caldeira da Silva - 417290\n");
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

    guia08_02 - Ludmily Caldeira da Silva - 417290
    
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