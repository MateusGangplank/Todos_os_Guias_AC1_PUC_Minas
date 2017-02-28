 // -------------------------------
// Guia 08_01 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

module exercicio1 (s, a, b, c, d);

output s;
input a, b, c, d;
wire temp[0:3];

and AND1 (temp[0], a, ~c, d);
and AND2 (temp[1], ~a, c);
and AND3 (temp[2], b, d);
and AND4 (temp[3], b, c);
or OR1 (s, temp[0], temp[1], temp[2], temp[3]);

endmodule //

module testexercicio1;  

wire s;
reg a, b, c, d;

exercicio1 exercicio1 (s, a, b, c, d);

 initial begin
      $display("\nguia08_01 - Ludmily Caldeira da Silva - 417290\n");
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

    guia08_01 - Ludmily Caldeira da Silva - 417290
    
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