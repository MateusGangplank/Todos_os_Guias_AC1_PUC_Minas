//--------------------
// Exercicio 11
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
//--------------------
module gate (output s,
                         input  [0:7] p);
assign s = p[0] & p[1] & p[2] & p[3] & p[4] & p[5] & p[6] & p[7];
endmodule // xor



module testgate;

   reg  [0:7] a; // definir registrador
wire s;   // definir conexao (fio)

   gate XOR1 (s, a);
   initial begin:start
	a=8'b11111111;   // 4 valores binarios

   end
   initial begin:main

			$display("\n  a     ^    b    =     s\n");
         $monitor("%b = %b", a, s);
  #1     a=8'b00000000; // valores binarios
end
endmodule // testgate