// -------------------------
// Extra1 - Complemento de um
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- complemento um
// -------------------------
module complementoum ( output [7:0]s, input [7:0]a);
assign s = ~(a);
endmodule // 
// ---------------------
// -- test complemento um
// ---------------------
module testnorgate;
// ------------------------- dados locais
   reg [7:0] a; 
   wire [7:0] s;    // definir conexao (fio)
// ------------------------- instancia
   complementoum COMPUM (s, a);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a='b110010; 
   end// ------------------------- parte principal
   initial begin
         $display("Extra1 - Gabriel Benjamim de Carvalho - 396690");
	#1	 $display("%8b Complemento de um -> %8b", a, s);

  end
endmodule // complemento um