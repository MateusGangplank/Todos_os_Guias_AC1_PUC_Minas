// Giselle Caroline Vieira
// Matricula:424649


module exercicio03 (s,v1,a,b);

input a,b;

output s,t1,t2,t3,t4,t5,t6,t7,t8,t9,v1;

wire t1,t2,t3,t4,t5,t6,t7,t8,t9;

nand NAND1 (t1,a);

nand NAND2 (t2,t1,b);

nand NAND3 (t3,t2);

nand NAND4 (t4,t3);

nand NAND5 (t5,b);

nand NAND6 (t6,a,t5);

nand NAND7 (t7,t6);

nand NAND8 (t8,t7);

nand NAND9 (s,t8,t4);

nand NAND10 (t9,t1,b);

nand NAND11 (v1,t9);

endmodule

module testexercicio03;

reg a,b;

wire s,v1;

exercicio03 meia (s,v1,a,b);

initial begin

$display ("Exercicio 03");

$display ("Meia soma usando apenas portas NAND /modelo compacto: AND, XOR, NOT, s0 e s1");

$monitor("%b  %b  s=%b v1=%b", a, b, s,v1);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  

end

endmodule