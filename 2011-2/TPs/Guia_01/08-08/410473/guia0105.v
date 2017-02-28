// Guia0105 - OR
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
// -- not gate
// -------------------

module notgate(output s, input p);
 
assign s = ~p; 
					
endmodule // notgate

// -------------------
// -- and gate
// -------------------

module andgate(output s, input p, input q);

assign s = p & q; 
					
endmodule // andgate

// -------------------
// -- test norgate
// ------------------- 

module testorgate;

reg a, b, c;
wire s, q1, q2;

norgate NOR1(q1, b, c);
notgate NOT1(q2, a);
andgate AND1(s, q2, q1);

initial begin: start

a=0; b=0; c=0;

end

initial begin: main

$display("Guia01 - Exercicio 05 - Pedro Tronbin - 410473");
$display("TEST OR GATE: ");
$display("\n( ~ a & ~ ( b | c ) = s ");
$monitor("( ~ %b & ~ ( %b | %b ) = %b ", a, b, c, s);
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end

endmodule // testorgate

//-----  SAIDA
//
// Guia01 - Exercicio 05 - Pedro Tronbin - 410473
// TEST OR GATE: 
//
// ( ~ a | ~ ( b & c ) = s
// ( ~ 0 | ~ ( 0 & 0 ) = 1
// ( ~ 0 | ~ ( 0 & 1 ) = 0
// ( ~ 0 | ~ ( 1 & 0 ) = 0
// ( ~ 0 | ~ ( 1 & 1 ) = 0
// ( ~ 1 | ~ ( 0 & 0 ) = 0
// ( ~ 1 | ~ ( 0 & 1 ) = 0
// ( ~ 1 | ~ ( 1 & 0 ) = 0
// ( ~ 1 | ~ ( 1 & 1 ) = 0