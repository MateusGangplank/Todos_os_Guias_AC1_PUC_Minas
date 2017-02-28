//-------------------------------------
//Guia 03
//Guilherme Lucindo dos Santos - 380766
//-------------------------------------

//-----------------------------
//-- Half adder com portas nand
//-----------------------------


module ex_03(s0,s1,a,b);

output s0,s1;
input a,b;
wire f1;

xorNand XOR1 (s1, a,b);
notNand NOT1 (fi, a);
andNand AND1 (s0,f1,b);

endmodule

module andNand (s,a,b);
 output s;
 input a,b;
 wire f1;
 
 nand NAND1 (f1, a, b);
 nand NAND2 (s, f1, f1);
 
 endmodule
 
 module xorNand (s, a, b);
 
 output s;
 input a, b;
 wire f1, f2, f3;
 
 nand NAND3 (f1, a, a);
 nand NAND4 (f2, f1, a);
 nand NAND5 (f3, f1, b);
 nand NAND6 (s, f2, f3);

endmodule

module notNand (s,a);
output s;
input a;

nand NAND7 (s, a, a);

endmodule

//-------------------
//-- teste half adder
//-------------------

module teste;

reg a,b;
wire s0,s1;

teste halfSubtractor(s0,s1,a,b);

initial begin

a=0; b=0;

end 

initial begin

$display("\n Exercicio 03 - Guilherme Lucindo dos Santos");
$display("\n Crcuito Meio subtrator");
$display("a - b = s0  s1");
$monitor("%d - %d = %d  %d", a, b, s0, s1);

#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;

end

endmodule