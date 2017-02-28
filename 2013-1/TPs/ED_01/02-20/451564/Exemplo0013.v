// -------------------------
// Exemplo0013 - AND
// Nome: Guilherme Augusto Bueno Borba
// Matricula: 451564
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s, 
                           input  p, 
                           input  q,
									input r);
assign s = p & q & r;
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b,c; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate AND1 (s, c,b,a);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0; c=0;
   end// ------------------------- parte principal
   initial begin
         $display("Exemplo0013 - Guilherme Augusto Bueno Borba - 451564");
         $display("Test AND gate");
         $display("\n a & b & c = s\n");
           a=0; b=0;
  #1   $monitor("%b & %b & %b = %b", a, b, c, s);
           #1 a=0;b=0;c=0;
			  #1 a=0;b=0;c=1;
			  #1 a=0;b=1;c=0;
			  #1 a=0;b=1;c=1;
			  #1 a=1;b=0;c=0;
			  #1 a=1;b=0;c=1;
			  #1 a=1;b=1;c=0;
			  #1 a=1;b=1;c=1; 
   end
endmodule // testandgate