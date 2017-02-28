// -------------------------
// Exemplo0006 - NAND
// Nome: Guilherme Augusto Bueno Borba
// Matricula: 451564
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module nandgate ( output s, 
                           input  p, 
                           input  q);
assign s = ~(p & q);
endmodule // nandgate
// ---------------------
// -- test and gate
// ---------------------
module testnandgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   nandgate NAND1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end// ------------------------- parte principal
   initial begin
         $display("Exemplo0006 - Guilherme Augusto Bueno Borba - 451564");
         $display("Test NAND gate");
         $display("\na & b = s\n");
           a=0; b=0;
     $monitor("(%b & %b)' = %b", a, b, s);
        #1   a=0; b=1;
			 #1 a=1;b=1;
			  #1 a=1;b=0;
			  #1 a=0;b=0;
    
  end
endmodule // testnandgate