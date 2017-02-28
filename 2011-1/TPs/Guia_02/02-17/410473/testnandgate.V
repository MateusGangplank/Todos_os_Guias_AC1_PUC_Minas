// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-02 Extra 02
// Data de entrega: 07-11/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

module nandgate(s, a, b);
output s;
input a, b;

assign s = ~(a|b);

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
reg a, b;
wire temp1, temp2, temp3, s;

nandgate NOR1(temp1, a, a);
nandgate NOR2(temp2, b ,b);
nandgate NOR3(temp3, temp1, temp2);
nandgate NOR4(s, temp3, temp3);

initial begin

a=0; b=0;

end

initial begin

$display( "Guia-02 - Pedro Tronbin - 410473" );
$display( "Test NAND gate" );
$monitor( " ~( %b & %b ) = %b ", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;  

end

endmodule // testnandgate

/* SAIDA

Guia-02 - Pedro Tronbin - 410473
    Test NAND gate
     ~( 0 & 0 ) = 1 
     ~( 0 & 1 ) = 1 
     ~( 1 & 0 ) = 1 
     ~( 1 & 1 ) = 0 

*/