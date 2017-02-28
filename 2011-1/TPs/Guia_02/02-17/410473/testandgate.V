// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-02 Exercicio 02
// Data de entrega: 07-11/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (s, a, b);
output s;
input a, b;

assign s = ~(a|b);

endmodule // andgate

// ---------------------
// -- test and gate
// ---------------------

module testandgate;
reg a, b;
wire s, temp1, temp2;

andgate NOR1 (temp1, a, a);
andgate NOR2 (temp2, b, b);
andgate NOR3 (s, temp1, temp2);

initial begin

a=0; b=0;

end

initial begin

$display( "Guia-02 - Pedro Tronbin - 410473" );
$display( "Test AND gate" );
$monitor( "%b & %b = %b ", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;  

end

endmodule // testandgate

/* SAIDA

Guia-02 - Pedro Tronbin - 410473
    Test AND gate
    0 & 0 = 0 
    0 & 1 = 0 
    1 & 0 = 0 
    1 & 1 = 1 

*/
