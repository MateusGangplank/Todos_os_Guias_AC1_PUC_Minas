//-------------------------------------
//Guia 03
//Guilherme Lucindo dos Santos - 380766
//-------------------------------------

//-----------------------------
//-- Half adder com portas nand
//-----------------------------


module ex_02 (s0,s1,a,b);

output s0,s1;
input a,b;
wire f1,f2;

andNand NAND1 (s0,a,b);
orNand OR1 (f1,a,b);
notNand NOT1 (f2, s0);
andNand AND2 (s1,f1,f2);

endmodule

module andNand (s,a,b);
 output s;
 input a,b;
 wire f1;
 
 nand NAND1 (f1, a, b);
 nand NAND2 (s, f1, f1);
 
 endmodule
 
 module orNand (s, a, b);
 
 output s;
 input a, b;
 wire f1, f2;
 
 nand NAND3 (f1, a, a);
 nand NAND4 (f2, b, b);
 nand NAND5 (s, f1, f2); 

endmodule

module notNand (s,a);
output s;
input a;

nand NAND6 (s, a, a);

endmodule

//-------------------
//-- teste half adder
//-------------------

module teste;

reg a,b;
wire s0,s1;

teste halfAdder(s0,s1,a,b);

initial begin

a=0; b=0;

end 

initial begin

$display("\n Exercicio 02 - Guilherme Lucindo dos Santos");
$display("\n Crcuito Meia soma");
$display("a + b = s0  s1");
$monitor("%d + %d = %d  %d", a, b, s0, s1);

#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;

end

endmodule