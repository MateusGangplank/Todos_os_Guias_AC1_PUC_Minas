//----------------------------------------------
//-- Alvaro Henrique de Araujo Rungue - 395487
//-- Prova 01 - letra g
//----------------------------------------------


//-- Quine de s1
module s1Quine (s1,a,b,c,d);
output s1;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t,t7,t8;

and AND1 (t1,~a,c,d);
and AND2 (t2,~b,c,d);
and AND3 (t3,b,~c,d);
and AND4 (t4,~a,b,c);
and AND5 (t5,a,~b,d);
and AND6 (t6,a,~c,d);
and AND7 (t7,a,~b,c);
and AND8 (t8,a,b,~c);
and AND9 (t9,a,b,~d);

or OR1 (s1,t1,t2,t3,t4,t5,t6,t7,t8,t9); 





endmodule //fim s1Quine

module testes1;

wire s1;
reg a,b,c,d;

//-- Inicio teste de s1

s1Quine Teste (s1,a,b,c,d);

 initial begin
 	   $display("\nAlvaro Henrique - 395487 \n");
      $display("\na  b   c   d  s1\n");
      $monitor("%b  %b   %b   %b  %b", a, b, c, d, s1);
  
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