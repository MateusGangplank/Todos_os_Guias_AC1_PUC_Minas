// -------------------------
// Exercicio10 - OR
// Nome: Adamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// -- or gate
// -------------------------
module orgate ( output s,
                         input  p, q);
assign s = p | q;
endmodule // orgate

module orgate1 (output s, input p, input q, input r);
wire temp1, st; // variaveis temporarias
orgate OR1 (temp1, p, q);
assign st = temp1 | r;
assign s = st;
endmodule//orgate1
// ---------------------
// -- test or gate
// ---------------------
module testorgate;
// ------------------------- dados locais
   reg   a, b, c; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   orgate1 OR1 (s, a, b, c);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0; c=0;
   end
// ------------------------- parte principal
   initial begin
         $display("Exercicio10 - Adamo Ludwig - 473319");
         $display("Test OR gate");
		$display("\na | b = s\n");
		$monitor("%b | %b | %b = %b", a, b, c, s);
    #1	   a=0; b=0; c=0;
    #1     a=0; b=0; c=1;
    #1     a=0; b=1; c=0;
    #1     a=0; b=1; c=1;
	#1	   a=1; b=0; c=0;
	#1	   a=1; b=0; c=1;
	#1	   a=1; b=1; c=0;
	#1	   a=1; b=1; c=1;
  end
endmodule // testorgate