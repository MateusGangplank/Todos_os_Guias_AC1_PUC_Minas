// Nome: Henrique Carvalho Parreira
// Matricula: 347133


module exercicio01 (s,v1,a,b);

input a,b;

output s,t1,t2,t3,t4,v1;

wire t1,t2,t3,t4;

not NOT1 (t1,a);

and AND1 (t2,t1,b);

not NOT2 (t3,b);

and AND2 (t4,t3,a);

or OR1 (s,t4,t2);

and AND3 (v1,a,b);

endmodule

module testexercicio01;

reg a,b;

wire s,v1;

exercicio01 meia (s,v1,a,b);

initial begin

$display ("Exercicio 01");

$display ("Meia soma usando AND, OR, NOT, AND, s e v1");

$monitor("%b  %b  s=%b v1=%b", a, b, v1,s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  

end

endmodule

