//----------------------------------------------
//-- Alvaro Henrique de Araujo Rungue - 395487
//-- Prova 01 - letra e
//----------------------------------------------


//-- Mapa de karnaugh de s0
 
module s0Karnaugh (s0,a,b,c,d);
output s0;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t,t7,t8;

and AND1 (t1,~a,~b,~c,d);
and AND2 (t2,~a,~b,c,~d);
and AND3 (t3,~a,b,~c,~d);
and AND4 (t4,a,~b,~c,~d);
and AND5 (t5,a,~b,c,d);
and AND6 (t6,a,b,~c,d);
and AND7 (t7,~a,b,c,d);
and AND8 (t8,a,b,c,~d);

or OR1 (s0,t1,t2,t3,t4,t5,t6,t7,t8); 





endmodule //fim s0Karnaugh

module testes0;

wire s0;
reg a,b,c,d;

//-- inicio teste mapa de s0

s0Karnaugh Teste (s0,a,b,c,d);

 initial begin
 	   $display("\nAlvaro Henrique - 395487 \n");
      $display("\na  b   c   d  s0\n");
      $monitor("%b  %b   %b   %b  %b", a, b, c, d, s0);
  
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

