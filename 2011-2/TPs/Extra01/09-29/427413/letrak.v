
 // ------------------------- 
// Prova 1 - Letra K
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// S1
// -------------------------
 
module S1(input a, input b, input c, input d, output s ); 
// ------------------------- definir dados 

assign s = (~(b^d))&(~(a^c));
endmodule // s1
// ------------------------- 