// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-02 Exercicio 03
// Data de entrega: 07-11/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- not gate
// ---------------------

module notgate (s, a, b);
output s;
input a, b;

assign s = ~(a&b);

endmodule // notgate

// ---------------------
// -- test not gate
// ---------------------

module testnotgate;
reg a;
wire s;

notgate NAND1 (s, a, a);

initial begin

a = 0;

end

initial begin 

#1 $display( "Guia-02 - Pedro Tronbin - 410473" );
#1 $display( "Test NOT gate" );
#1 $monitor( "~%b = %b ", a, s);
#1 a=1;

end

endmodule // testnotgate
 
/* SAIDA

Guia-02 - Pedro Tronbin - 410473
    Test NOT gate
    ~0 = 1 
    ~1 = 0 

*/




