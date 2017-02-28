 // -------------------------------
// Prova 01_g 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

module s1 (s, a, b, c, d);

output s;
input a, b, c, d;
wire temp[0:8];

and AND1 (temp[0], ~a, c, d);
and AND2 (temp[1], ~b, c, d);
and AND3 (temp[2], ~a, b, c);
and AND4 (temp[3], a, ~b, d);
and AND5 (temp[4], a, ~c, d);
and AND6 (temp[5], a, ~b, c);
and AND7 (temp[6], a, b, ~c);
and AND8 (temp[7], a, b, ~d);
and AND9 (temp[8], b, ~c, d);
or OR1 (s, temp[0], temp[1], temp[2], temp[3], temp[4], temp[5], temp[6], temp[7], temp[8]);

endmodule //

module tests1;  

wire s;
reg a, b, c, d;

s1 s1 (s, a, b, c, d);

 initial begin
      $display("\Prova 01_g - Ludmily Caldeira da Silva - 417290\n");
      $display("TESTE\n");
      $display("\na   b   c    d    s1\n");
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

    Prova 01_g - Ludmily Caldeira da Silva - 417290
    
    TESTE
    
    
    a   b   c    d    s1
    
    0   0   0    0    0
    0   0   0    1    0
    0   0   1    0    0
    0   0   1    1    1
    0   1   0    0    0
    0   1   0    1    1
    0   1   1    0    1
    0   1   1    1    1
    1   0   0    0    0
    1   0   0    1    1
    1   0   1    0    1
    1   0   1    1    1
    1   1   0    0    1
    1   1   0    1    1
    1   1   1    0    1
    1   1   1    1    0
    

*/