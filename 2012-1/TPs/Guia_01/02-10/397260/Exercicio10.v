// -------------------------
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
// -------------------------
// -------------------------
// -- or gate
// -------------------------

// UMA SAIDA, NAO DUAS !

module orgate ( output s,
					 output r,
                            input  a, 
									 input  b,
									 input  c);
assign s = a|b;
assign r = s|c;
endmodule // orgate
// ---------------------
// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
   reg   a, b, c; // definir registradores
wire  s, r;    // definir conexao (fio)
// ------------------------- instancia
   orgate NOR1 (s, r, a, b, c);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0; c=0;
   end// ------------------------- parte principal
   initial begin
      $monitor("Exercicio2 - Pedro Henrique Hardeman Guedes - 397260");
      $monitor("Test NOR gate");
$monitor("\na & b = s\n");
      a=0; b=0; c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
    	a=0; b=0; c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
      a=0; b=1; c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
      a=1; b=0; c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
  		a=0; b=1; c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
		a=1; b=0; c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
		a=1; b=1; c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
		a=1; b=1; c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, r);
end
endmodule // testorgate