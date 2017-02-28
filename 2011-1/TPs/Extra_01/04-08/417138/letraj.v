//---------------
// LUIZ MARQUES DE OLIVEIRA
// PROVA LETRA J
//---------------

module letraj (s,a,b,c,d);
output s;
input a,b,c,d;



and AND1 (s, a,b,c,d);



endmodule //fim letraj

module testeletraj;

wire s;
reg a,b,c,d;

letraj J (s,a,b,c,d);

 initial begin
	   $display("LUIZ MARQUES DE OLIVEIRA");
 		$display("PROVA - LETRA J");
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

