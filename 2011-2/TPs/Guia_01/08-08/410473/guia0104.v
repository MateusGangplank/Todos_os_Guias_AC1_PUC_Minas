// Guia0104 - AND
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
// -- not gate
// -------------------

module notgate(output s, input p);
 
assign s = ~p; 
					
endmodule // notgate

// -------------------
// -- or gate
// -------------------

module orgate(output s, input p, input q);
 
assign s = p | q; 
					
endmodule // orgate

// -------------------
// -- test andgate
// ------------------- 

module testandgate;

reg a, b, c;
wire s, q1, q2;

nandgate NAND1(q1, b, c);
notgate NOT1(q2, a);
orgate OR1(s, q2, q1);

initial begin: start

a=0; b=0; c=0;

end

initial begin: main

$display("Guia01 - Exercicio 04 - Pedro Tronbin - 410473");
$display("TEST AND GATE: ");
$display("\n( ~ a | ~ ( b & c ) = s ");
$monitor("( ~ %b | ~ ( %b & %b ) = %b ", a, b, c, s);
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end

endmodule // testandgate

//-----  SAIDA
//
// Guia01 - Exercicio 04 - Pedro Tronbin - 410473
// TEST AND GATE: 
//
// ( ~ a | ~ ( b & c ) = s
// ( ~ 0 | ~ ( 0 & 0 ) = 1
// ( ~ 0 | ~ ( 0 & 1 ) = 1
// ( ~ 0 | ~ ( 1 & 0 ) = 1
// ( ~ 0 | ~ ( 1 & 1 ) = 1
// ( ~ 1 | ~ ( 0 & 0 ) = 1
// ( ~ 1 | ~ ( 0 & 1 ) = 1
// ( ~ 1 | ~ ( 1 & 0 ) = 1
// ( ~ 1 | ~ ( 1 & 1 ) = 0