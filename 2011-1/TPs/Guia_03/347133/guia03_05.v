// Nome: Henrique Carvalho Parreira
// Matricula: 347133

module exercicio05 (s,v1,a,b);

input a,b;

output s,t1,t2,t3,t4,t5,t6,t7,t8,v1;

wire t1,t2,t3,t4,t5,t6,t7,t8;

or OR1 (t1,a);

or OR2 (t2,t1);

or OR3 (t3,b);

or OR4 (t4,t2,t3);

or OR5 (t5,t3);

or OR6 (t6,t5,t1);

or OR7 (t7, t4,t6);

or OR8 (t8,t1);

or OR9 (v1,t3,t8);

or OR10 (s,t7);

endmodule

module testexercicio05;

reg a,b;

wire s,v1;

exercicio05 meia (s,v1,a,b);

initial begin

$display ("Exercicio 05");

$display ("Meia diferença usando apenas portas NOR /modelo tradicional: AND, OR, NOT, AND, s0 e s1");

$monitor("%b  %b  s=%b v1=%b", a, b, s,v1);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  

end

endmodule

