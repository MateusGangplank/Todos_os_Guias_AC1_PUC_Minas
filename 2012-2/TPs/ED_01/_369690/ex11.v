// -------------------------
// Ex11 - NOR
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- OR gate
// -------------------------
module notgate (output s,input  p);
assign s = ~p;
endmodule

module orgate ( output s, input  p,input  q);
assign s = p | q;
endmodule 

module orfourgate ( output s, input  p,input  q, input r, input t);
output s1, s2;
wire s;
orgate OR1 (s1, p, q);
orgate OR2 (s2, r, t);
orgate OR3 (s, s1, s2);
endmodule

module noreightgate ( output s, input  p,input  q, input r, input t, input a, input b, input c, input d);
output s1, s2, s3;
wire s;

orfourgate ORFOUR1 (s1, p, q, r, t);
orfourgate ORFOUR2 (s2, a, b, c, d);
orgate OR1 (s3, s1, s2);
notgate NOT1(s, s3);
endmodule
// ---------------------
// -- test OR gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b, c, d, e, f, g, h; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   orfourgate ORFOUR1 (s, a, b, c, d);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0;b=0;c=0;d=0;e=0;f=0;g=0;h=0;
   end// ------------------------- parte principal
   initial begin
         $display("Ex11 - Gabriel Benjamim de Carvalho - 396690");
         $display("Test NOR gate");
         $display("\na | b | c | d = s\n");
         $monitor("%b | %b | %b | %b = %b", a, b, c, d, s);
	//Como testar as 256 linhas com o monitor?
  // #1    a=0;b=0;c=0;d=0;		 
  // #1    a=0;b=0;c=0;d=1;
  // #1    a=0;b=0;c=1;d=0;
  // #1    a=0;b=0;c=1;d=1;
  // #1    a=0;b=1;c=0;d=0;
  // #1    a=0;b=1;c=0;d=1;
  // #1    a=0;b=1;c=1;d=0;
  // #1    a=0;b=1;c=1;d=1;
  // #1    a=1;b=0;c=0;d=0;
  // #1    a=1;b=0;c=0;d=1;
  // #1    a=1;b=0;c=1;d=0;
  // #1    a=1;b=0;c=1;d=1;
  // #1    a=1;b=1;c=0;d=0;
  // #1    a=1;b=1;c=0;d=1;
  // #1    a=1;b=1;c=1;d=0;
  // #1    a=1;b=1;c=1;d=1;
 
  end
endmodule // testORgate