// -------------------------
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output c, 
                               input  a, 
                               input  b, 
										 input  d);
assign c = (a & b & d);
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b, d; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate AND1 (s, a, b, d);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0; d=0;
   end// ------------------------- parte principal
   initial begin
      $display("Exercicio1 - Pedro Henrique Hardeman Guedes - 397260");
      $display("Test AND gate");
$display("\na & b = s\n");
      a=0; b=0; d=0;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
    	a=0; b=0; d=1;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
      a=0; b=1; d=0;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
      a=1; b=0; d=0;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
  		a=0; b=1; d=1;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
		a=1; b=0; d=1;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
		a=1; b=1; d=0;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
		a=1; b=1; d=1;
  #1  $display("%b & %b & %b = %b", a, b, d, s);
end
endmodule // testandgate