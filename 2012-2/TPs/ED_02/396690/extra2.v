// -------------------------
// Extra2 - Complemento de dois
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- complemento dois
// -------------------------
module complementodois ( output [7:0]s, input [7:0]a);
assign s = ~(a) + 1'b1;
endmodule // 
// ---------------------
// -- test complemento dois
// ---------------------
module testnorgate;
// ------------------------- dados locais
   reg [7:0] a; 
   wire [7:0] s;    // definir conexao (fio)
// ------------------------- instancia
   complementodois COMPDOIS (s, a);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a='b110010; 
   end// ------------------------- parte principal
   initial begin
         $display("Extra2 - Gabriel Benjamim de Carvalho - 396690");
	#1	 $display("%8b Complemento de dois -> %8b", a, s);

  end
endmodule // complemento dois