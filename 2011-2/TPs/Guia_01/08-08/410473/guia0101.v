// Guia0101 - NAND
// Nome: Pedro Tronbin
// Matricula: 410473
// -------------------

// ------------------- 


// -------------------
// -- nand gate
// -------------------

module nandgate(output s, input p, q);

assign s = ( ~ ( p & q ) );

endmodule // nandgate

// -------------------
// -- test nandgate
// ------------------- 

module testnandgate;

reg a, b;
wire s;

nandgate NAND1(s, a, b);

initial begin: start

a=0; b=0;

end

initial begin: main

$display("Guia01 - Exercicio 01 - Pedro Tronbin - 410473");
$display("TEST NAND GATE: ");
$display("\n( ~ ( a & b ) ) = s");
a=0; b=0;
#1 $display("( ~ ( %b & %b ) ) = %b", a, b, s);
a=0; b=1;
#1 $display("( ~ ( %b & %b ) ) = %b", a, b, s);
a=1; b=0;
#1 $display("( ~ ( %b & %b ) ) = %b", a, b, s);
a=1; b=1;
#1 $display("( ~ ( %b & %b ) ) = %b", a, b, s);

end

endmodule // testnandgate

//-----  SAIDA
//
// Guia01 - Exercicio 01 - Pedro Tronbin - 410473
// TEST NAND GATE: 
//
// ( ~ ( a & b ) ) = s
// ( ~ ( 0 & 0 ) ) = 1
// ( ~ ( 0 & 1 ) ) = 1
// ( ~ ( 1 & 0 ) ) = 1
// ( ~ ( 1 & 1 ) ) = 0
