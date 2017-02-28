//----------------------------------------------
//-- Alvaro Henrique de Araujo Rungue - 395487
//-- Prova 01 - letra j
//----------------------------------------------


//-- S2 AND
module s2 (s,a,b,c,d);
output s;
input a,b,c,d;



and AND1 (s, a,b,c,d);



endmodule //fim s2

//-- Inicio teste and

module testes2;

wire s;
reg a,b,c,d;

s2 Teste (s,a,b,c,d);

 initial begin
 	   $display("\nAlvaro Henrique - 395487 \n");
      $display("\na  b   c   d  s2\n");
      $monitor("%b  %b   %b   %b  %b", a, b, c, d, s);
  
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
    endmodule