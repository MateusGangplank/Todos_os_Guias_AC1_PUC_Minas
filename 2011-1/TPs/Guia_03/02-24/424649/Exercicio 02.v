// Giselle Caroline Vieira
// Matricula:424649


module exercicio02 (s,v1,a,b);

input a,b;

output s,t1,t2,t3,t4,v1;

wire t1,t2,t3,t4,t5;

nand NAND1 (t1,a);

nand NAND2 (t2,b);

nand NAND3 (t3,a,b);

nand NAND4 (t4,t1,t2);

nand NAND5 (t5,t4,t3);

nand NAND6 (v1,t3);

nand NAND7 (s,t5);

endmodule

module testexercicio02;

reg a,b;

wire s,v1;

exercicio02 meia (s,v1,a,b);

initial begin

$display ("Exercicio 02");

$display ("Meia soma usando apenas portas NAND / modelo tradicional: AND, OR, NOT, AND, s0 e s1");

$monitor("%b  %b  s=%b v1=%b", a, b, s,v1);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  

end

endmodule