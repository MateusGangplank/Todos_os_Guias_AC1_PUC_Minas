//----------------------------------------------
//-- Alvaro Henrique de Araujo Rungue - 395487
//-- Prova 01 - letra f
//---------------------------------------------

//-- s0 usando com ALGEBRA
module s0algebra (s0,a,b,c,d);
output s0;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t,t7,t8;

xor XOR1 (t1,c,d);
xor XOR2 (t2,a,c);
xor XOR3 (t3,a,b);
xor XOR4 (t4,b,d);

and AND1 (t5, ~a,~b,t1);
and AND2 (t6, t2,b,d);
and AND3 (t7, t3,~c,~d);
and AND4 (t8, t4,a,c);

or OR1 (s0,t5,t6,t7,t8);



endmodule //fim s0algebra

//-- inicio teste s0

module testes0;

wire s0;
reg a,b,c,d;

s0algebra Teste (s0,a,b,c,d);

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

