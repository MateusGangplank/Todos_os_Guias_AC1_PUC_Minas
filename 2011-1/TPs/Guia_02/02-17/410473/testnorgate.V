// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-02 Extra 01
// Data de entrega: 07-11/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

module norgate(s, a, b);
output s;
input a, b;

assign s = ~(a&b);

endmodule // norgate

// ---------------------
// -- test nor gate
// ---------------------

module testnorgate;
reg a, b;
wire temp1, temp2, temp3, s;

norgate NAND1(temp1, a, a);
norgate NAND2(temp2, b, b);
norgate NAND3(temp3, temp1, temp2);
norgate NAND4(s, temp3, temp3);

initial begin

a=0; b=0;

end

initial begin

$display( "Guia-02 - Pedro Tronbin - 410473" );
$display( "Test NOR gate" );
$monitor( " ~( %b | %b ) = %b ", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;  

end

endmodule // testnorgate

/* SAIDA

Guia-02 - Pedro Tronbin - 410473
    Test NOR gate
     ~( 0 | 0 ) = 1 
     ~( 0 | 1 ) = 0 
     ~( 1 | 0 ) = 0 
     ~( 1 | 1 ) = 0 

*/