// -------------------------
// Exercicio09 - AND
// Nome: Adamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s, 
                           input  p, 
                           input  q);
assign s = p & q ;
endmodule // andgate

module andgate1 (output s1, input p, input q, input r);
wire temp1,st; // st é uma variavel temporaria
andgate AND1(temp1, p,q);
assign st = temp1 & r;
assign s1 = st;
endmodule //andgate1

// ----------------------
// -- test and gate
// ----------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b, c; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate1 AND1 (s, a, b, c);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;c=0; //syntax error Syntax in assignment statement 1-value (havia colocado ; no lugar da ,)
   end
// ------------------------- parte principal
   initial begin
         $display("Exercicio09 - Adamo Ludwig - 473319");
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