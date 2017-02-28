// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-02 Exercicio 01
// Data de entrega: 07-11/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- or gate
// ---------------------

module orgate (s, a, b);
output s;
input a, b;

assign s = ~(a&b);

endmodule // orgate

// ---------------------
// -- test or gate
// ---------------------

module testorgate;
reg a, b;
wire s, temp1, temp2;

orgate NAND1 (temp1, a, a);
orgate NAND2 (temp2, b, b);
orgate NAND3 (s, temp1, temp2 );

initial begin

a = 0; b = 0;

end

initial begin

$display( "Guia-02 - Pedro Tronbin - 410473" );
$display( "Test OR gate" );
$monitor( "%b | %b = %b ", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;  

end

endmodule // testorgate

/* SAIDA

Guia-02 - Pedro Tronbin - 410473
    Test OR gate
     0 | 0 = 0 
     0 | 1 = 1 
     1 | 0 = 1 
     1 | 1 = 1 

*/