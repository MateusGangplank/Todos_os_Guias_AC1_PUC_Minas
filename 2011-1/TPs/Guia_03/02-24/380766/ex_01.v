//-------------------------------------
//Guia 03
//Guilherme Lucindo dos Santos - 380766
//-------------------------------------

//-----------------------------
//-- Half adder com portas nand
//-----------------------------


module ex_01 (s0,s1,a,b);

output s0,s1;
input a,b;
wire f1,f2;

and NAND1 (s0,a,b);
or OR1 (f1,a,b);
not NOT1 (f2, s0);
and AND2 (s1,f1,f2);

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

$display("\n Exercicio 01 - Guilherme Lucindo dos Santos");
$display("\n Crcuito Meia soma");
$display("a + b = s0  s1");
$monitor("%b + %b = %b  %b", a, b, s0, s1);

#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;

end

endmodule