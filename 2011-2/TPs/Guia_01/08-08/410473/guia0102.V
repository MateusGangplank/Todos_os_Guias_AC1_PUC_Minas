// Guia0102 - NOR
// Nome: Pedro Tronbin
// Matricula: 410473
// -------------------

// ------------------- 


// -------------------
// -- nor gate
// -------------------

module norgate(output s, input p, q);

assign s = ( ~ ( p | q ) );

endmodule // norgate

// -------------------
// -- test norgate
// ------------------- 

module testnorgate;

reg a, b;
wire s;

norgate NOR1(s, a, b);

initial begin: start

a=0; b=0;

end

initial begin: main

$display("Guia01 - Exercicio 02 - Pedro Tronbin - 410473");
$display("TEST NOR GATE: ");
$display("\n( ~ ( a | b ) ) = s");
$monitor("( ~ ( %b | %b ) ) = %b", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;

end

endmodule // testnorgate

//-----  SAIDA
//
// Guia01 - Exercicio 02 - Pedro Tronbin - 410473
// TEST NOR GATE: 
//
// ( ~ ( a | b ) ) = s
// ( ~ ( 0 | 0 ) ) = 1
// ( ~ ( 0 | 1 ) ) = 0
// ( ~ ( 1 | 0 ) ) = 0
// ( ~ ( 1 | 1 ) ) = 0
