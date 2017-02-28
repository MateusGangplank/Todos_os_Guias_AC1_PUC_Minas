// -------------------------
// Exec10 - OR
// Nome: Matheus de Souza Castro Santos
// Matricula: 466516
// -------------------------
// -------------------------
// -- or gate
// -------------------------
module orgate ( output t, input s,
									input x,
                           input r);
wire temp1;
or or1 ( temp1, s , x );
or or2 ( t , r, temp1 ) ;
endmodule // orgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b, c; // definir registradores
wire  t;    // definir conexao (fio)
// ------------------------- instancia
   orgate AND1 (t, a, b, c);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0; c=0;
   end
	// ------------------------- parte principal
   initial begin
         $display("Exec10 - Matheus de Souza Castro Santos - 466516");
         $display("Test OR gate");
         $display("\na & b & c = t\n");
           a=0; b=0; c=0;
  #1   $display("%b & %b & %b = %b", a, b, c, t);
           a=0; b=0; c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, t);
           a=0; b=1; c=0;
  #1   $display("%b & %b & %b = %b", a, b, c, t);
           a=0; b=1; c=1;
  #1   $display("%b & %b & %b = %b", a, b, c, t);
           a=1; b=0; c=0;
  #1   $display("%b & %b & %b = %b", a, b, c, t);
           a=1; b=0; c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, t);
           a=1; b=1; c=0;
  #1   $display("%b & %b & %b = %b", a, b, c, t);
           a=1; b=1; c=1;
  #1   $display("%b & %b & %b = %b", a, b, c, t);
  end
endmodule // testorgate