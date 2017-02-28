 // -------------------------------
// Prova 01_f 
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

module s0 (s, a, b, c, d);

output s;
input a, b, c, d;
wire temp[0:11];

and AND1 (temp[0], ~a, ~b);
and AND2 (temp[1], b, d);
and AND3 (temp[2], ~c, ~d);
and AND4 (temp[3], a, c);

xor XOR1 (temp[8], c, d);
xor XOR2 (temp[9], a, c);
xor XOR3 (temp[10], a, b);
xor XOR4 (temp[11], b, d);
and AND5 (temp[4], temp[0], temp[8]);
and AND6 (temp[5], temp[1], temp[9]);
and AND7 (temp[6], temp[2], temp[10]);
and AND8 (temp[7], temp[3], temp[11]);
or OR1 (s, temp[4], temp[5], temp[6], temp[7]);

endmodule //

module tests0;  

wire s;
reg a, b, c, d;

s0 s0 (s, a, b, c, d);

 initial begin
      $display("\Prova 01_f - Ludmily Caldeira da Silva - 417290\n");
      $display("TESTE\n");
      $display("\na   b   c    d    s0\n");
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

    Prova 01_f - Ludmily Caldeira da Silva - 417290
    
    TESTE
    
    
    a   b   c    d    s0
    
    0   0   0    0    0
    0   0   0    1    1
    0   0   1    0    1
    0   0   1    1    0
    0   1   0    0    1
    0   1   0    1    0
    0   1   1    0    0
    0   1   1    1    1
    1   0   0    0    1
    1   0   0    1    0
    1   0   1    0    0
    1   0   1    1    1
    1   1   0    0    0
    1   1   0    1    1
    1   1   1    0    1
    1   1   1    1    0 

*/