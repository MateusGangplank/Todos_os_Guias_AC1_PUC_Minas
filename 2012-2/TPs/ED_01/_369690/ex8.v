// -------------------------
// Ex8 - AND
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,input  p, input  q, input r, input t);
assign s = p & q & r & t;
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b, c, d; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate AND1 (s, a, b, c, d);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0;b=0;c=0;d=0;  
   end// ------------------------- parte principal
   initial begin
         $display("Ex8 - Gabriel Benjamim de Carvalho - 396690");
         $display("Test AND gate");
         $display("\na & b & c & d = s\n");
         $monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
  #1    a=0;b=0;c=0;d=0;		 
  #1    a=0;b=0;c=0;d=1;
  #1    a=0;b=0;c=1;d=0;
  #1    a=0;b=0;c=1;d=1;
  #1    a=0;b=1;c=0;d=0;
  #1    a=0;b=1;c=0;d=1;
  #1    a=0;b=1;c=1;d=0;
  #1    a=0;b=1;c=1;d=1;
  #1    a=1;b=0;c=0;d=0;
  #1    a=1;b=0;c=0;d=1;
  #1    a=1;b=0;c=1;d=0;
  #1    a=1;b=0;c=1;d=1;
  #1    a=1;b=1;c=0;d=0;
  #1    a=1;b=1;c=0;d=1;
  #1    a=1;b=1;c=1;d=0;
  #1    a=1;b=1;c=1;d=1;
  
 
  end
endmodule // testandgate