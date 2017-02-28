// Guia0103 - XNOR
// Nome: Pedro Tronbin
// Matricula: 410473
// -------------------

// ------------------- 


// -------------------
// -- xnor gate
// -------------------

module xnorgate(output s, input p, q);

assign s = ( ~ ( p ^ q ) );

endmodule // xnorgate

// -------------------
// -- test xnorgate
// ------------------- 

module testxnorgate;

reg a, b;
wire s;

xnorgate XNOR1(s, a, b);

initial begin: start

a=0; b=0;

end

initial begin: main

$display("Guia01 - Exercicio 03 - Pedro Tronbin - 410473");
$display("TEST XNOR GATE: ");
$display("\n( ~ ( a ^ b ) ) = s");
$monitor("( ~ ( %b ^ %b ) ) = %b", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;

end

endmodule // testxnorgate

//-----  SAIDA
//
// Guia01 - Exercicio 03 - Pedro Tronbin - 410473
// TEST XNOR GATE: 
//
// ( ~ ( a ^ b ) ) = s
// ( ~ ( 0 ^ 0 ) ) = 1
// ( ~ ( 0 ^ 1 ) ) = 0
// ( ~ ( 1 ^ 0 ) ) = 0
// ( ~ ( 1 ^ 1 ) ) = 1
