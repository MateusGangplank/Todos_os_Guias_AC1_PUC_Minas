// -------------------------
// Exercicio08 - AND
// Nome: xxx yyy zzz
// Matricula: 999999
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
   reg   a, b, c; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate AND1 (s, a, b, c);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;c=0; //syntax error Syntax in assignment statement 1-value (havia colocado ; no lugar da ,)
   end
// ------------------------- parte principal
   initial begin
         $display("Exercicio08 - xxx yyy zzz - 999999");
         $display("Test AND gate");
         $display("\na & b = s\n");
         $monitor("%b & %b & %b = %b", a, b, c, s);  
	#1	   a=0; b=0; c=0;
    #1     a=0; b=0; c=1;
    #1     a=0; b=1; c=0;
    #1     a=0; b=1; c=1;
	#1	   a=1; b=0; c=0;
	#1	   a=1; b=0; c=1;
	#1	   a=1; b=1; c=0;
	#1	   a=1; b=1; c=1;
  end
endmodule // testandgate