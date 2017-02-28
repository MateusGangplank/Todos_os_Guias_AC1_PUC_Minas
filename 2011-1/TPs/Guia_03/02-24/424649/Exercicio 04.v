// Giselle Caroline Vieira
// Matricula:424649


module exercicio04 (s,v1,a,b);

input a,b;

output s,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10t,t11,v1;

wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10t,t11;

or OR1 (t1,a);

or OR2 (t2,t1);

or OR3 (t3,b);

or OR4 (t4,t2,t3);

or OR5 (t5,b);

or OR6 (t6,t5);

or OR7 (t7,a);

or OR8 (t8,t6,t7);

or OR9 (t9,t4,t8);

or OR10 (s,t9);

or OR11 (t10,b);

or OR12 (t11,a);

or OR13 (v1,t10,t11);

endmodule

module testexercicio04;

reg a,b;

wire s,v1;

exercicio04 meia (s,v1,a,b);

initial begin

$display ("Exercicio 04");

$display ("Meia soma usando apenas portas NOR /modelo tradicional: AND, OR, NOT, AND, s0 e s1");

$monitor("%b  %b  s=%b v1=%b", a, b, s,v1);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  

end

endmodule

// OBS: Theldo este exercicio deui errado