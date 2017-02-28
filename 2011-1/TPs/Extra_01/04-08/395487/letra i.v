//----------------------------------------------
//-- Alvaro Henrique de Araujo Rungue - 395487
//-- Prova 01 - letra i
//----------------------------------------------

//-- s1 usando algebra

module s1algebra (s1,a,b,c,d);
output s1;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t,t7,t8;

xor XOR1 (t1,a,c);
xor XOR2 (t2,b,c);
xor XOR3 (t3,a,b);
xor XOR4 (t4,b,d);

and AND1 (t5, t1,d);
and AND2 (t6, t2,d);
and AND3 (t7, t3,c);
and AND4 (t8, t4,a);

or OR1 (s1,t5,t6,t7,t8);



endmodule //fim s1algebra

module testes1;

wire s1;
reg a,b,c,d;

//-- inicio teste s1

s1algebra Teste (s1,a,b,c,d);

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