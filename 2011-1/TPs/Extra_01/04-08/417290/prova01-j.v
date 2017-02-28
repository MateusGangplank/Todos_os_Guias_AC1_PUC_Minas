 // -------------------------------
// Prova 01_j 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

module s2 (s, a, b, c, d);

output s;
input a, b, c, d;

and AND1 (s, a, b, c, d);

endmodule //

module tests2;  

wire s;
reg a, b, c, d;

s2 s2 (s, a, b, c, d);

 initial begin
      $display("\Prova 01_j - Ludmily Caldeira da Silva - 417290\n");
      $display("TESTE\n");
      $display("\na   b   c    d    s2\n");
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
 
endmodule //

/*

RESULTADOS OBTIDOS

        Prova 01_j - Ludmily Caldeira da Silva - 417290
    
    TESTE
    
    
    a   b   c    d    s2
    
    0   0   0    0    0
    0   0   0    1    0
    0   0   1    0    0
    0   0   1    1    0
    0   1   0    0    0
    0   1   0    1    0
    0   1   1    0    0
    0   1   1    1    0
    1   0   0    0    0
    1   0   0    1    0
    1   0   1    0    0
    1   0   1    1    0
    1   1   0    0    0
    1   1   0    1    0
    1   1   1    0    0
    1   1   1    1    1    

*/