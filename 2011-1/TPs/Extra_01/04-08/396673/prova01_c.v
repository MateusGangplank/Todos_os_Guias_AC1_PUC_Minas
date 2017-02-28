// ---------------------
// Prova01_c
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

// ---------------------
// -- s1 com mintermos
// ---------------------

module s1mintermos (s1,a,b,c,d);
output s1;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t,t7,t8,t9,t10;

and AND1(t1,~a,~b,c,d);
and AND2(t2,~a,b,~c,d);
and AND3 (t3, ~a,b,c,~d);
and AND4 (t4,~a,b,c,d);
and AND5 (t5,a,~b,~c,d);
and AND6 (t6,a,~b,c,~d);
and AND7 (t7,a,~b,c,d);
and AND8 (t8,a,b,~c,~d);
and AND9 (t9,a,b,~c,d);
and AND10 (t10,a,b,c,~d);

or OR1 (s1,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10); 

endmodule //fim s1mintermos

// ---------------------
// -- teste s1 com mintermos
// ---------------------

module testes1mintermos;

wire s1;
reg a,b,c,d;

s1mintermos Teste (s1,a,b,c,d);

 initial begin
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

//fim testes1mintermos