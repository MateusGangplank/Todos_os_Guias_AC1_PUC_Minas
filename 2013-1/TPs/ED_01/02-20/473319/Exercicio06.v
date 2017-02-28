// ---------------------
// Exercicio06 - xor
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------
// ---------------------
// -- xor gate
// ---------------------
module xorgate (output [0:3] s,
                         input  [0:3] p,
                         input  [0:3] q);
assign s = (~p&q)+(p&~q);
endmodule // xor
// ---------------------
// -- test xorgate
// ---------------------
module testxorgate;
// ------------------------- dados locais
   reg  [0:3] a,b; // definir registrador
wire [0:3] s;   // definir conexao (fio)
// ------------------------- instancia
   xorgate XOR1 (s, a, b);// ------------------------- preparacao
   initial begin:start
a=4'b0011;   // 4 valores binarios
            b=4'b0101;   // 4 valores binarios
   end
// ------------------------- parte principal
   initial begin:main
         $display("Exercicio06 - xxx yyy zzz - 999999");
         $display("Test xor gate");
$display("\n  a     ^    b    =     s\n");
         $monitor("%b ^ %b = %b", a, b, s);
  #1     a=0; b=0; 
  #1     a=0; b=1; 
  #1     a=1; b=0; 
  #1     a=1; b=1; 
 end
endmodule // testxorgate