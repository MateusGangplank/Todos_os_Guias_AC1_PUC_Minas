// -------------------------
// Exemplo0002 - NOT
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- not gate
// -------------------------
module notgate (output s,input a
                        input  b);
assign s = ~(a & b );
endmodule // notgate
// -------------------------
// -- test not gate
// -------------------------
module testnotgate;
// ------------------------- dados locais
   reg    a,b;   // definir registrador
                 // (variavel independente)
   wire   s;   // definir conexao (fio)
                // (variavel dependente  )
// ------------------------- instancia
   notgate NOT1 (s, a,b);
// ------------------------- preparacao
   initial begin:start
      a=0;
		b=0;    // valor inicial
   end// ------------------------- parte principal
   initial begin
         $display("Exemplo0002 - xxx yyy zzz - 999999");
         $display("Test NOT gate");
$display("\n~a = s\n");
          a=0;
  #1   $display("~%b = %b", a,b, s);
           a=1;
  #1   $display("~%b = %b", a,b, s);
   end
endmodule // testnotgate