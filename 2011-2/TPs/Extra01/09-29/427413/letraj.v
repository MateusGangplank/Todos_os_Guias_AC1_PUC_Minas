
 // ------------------------- 
// Prova 1 - Letra J
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// S2
// ------------------------- 
module S2(output s, input a, input b, input c, input d); 
// ------------------------- definir dados 
wire k,l,m,n,o,p,r,t;

not n1 (k,c);
not n2 (l,d);
and a1 (m,a,k);
and a2 (n,b,k);
and a3 (o,n,l);
and a4 (p,a,b);
and a5 (r,p,l);
or o1 (t,m,o);
or o3 (s,t,r);
endmodule // s2
// ------------------------- 