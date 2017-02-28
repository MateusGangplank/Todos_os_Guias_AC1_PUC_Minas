
 // ------------------------- 
// Prova 1 - Letra L
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// S0
// -------------------------
 
module S0(input [3:0] x, output s ); 
// ------------------------- definir dados 

wire na, nb, nc;
wire k, l, m, n;

not n1 (na, x[0]);
not n2 (nb, x[1]);
not n3 (nc, x[2]);
and a1 (k, nb, x[3]);
and a2 (l, na, x[2]);
and a3 (m, k, l);
and a4 (n, nc, x[0]);
or o1 (s, m, n);

endmodule // s1
// ------------------------- 