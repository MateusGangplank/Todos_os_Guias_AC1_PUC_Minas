// -------------------------
// Exemplo0011 - XOR com Expressao
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- XOR gate
// -------------------------
module xorgate (output [0:3]s, 
                 input  [0:3]p, input [0:3]q);

  assign s = (~p & q) | (p & ~q); // criar vinculo permanente (dependencia)
endmodule // xor gate

// -------------------------
// -- test xor gate
// -------------------------

module testxorgate;

// ------------------------- dados locais
reg  [0:3] a,b; // definir registrador
wire [0:3] s;  // definir conexao (fio)

// ------------------------- instancia
xorgate XOR1 (s, a,b);
// ------------------------- preparacao

initial begin:start
  a = 4'b0011;
  b = 4'b0101;
end


// ------------------------- parte principal
initial begin:main
               // execucao unitaria
  $display("Exemplo 0011 - DavidsonFrancis - 466499");
  $display("Test XOR gate:");
  $display("\n(~a & b) | (a & ~b) = s\n");
  $monitor("%b ^ %b = %b", a,b, s);
 
  #1 a = 0;       b = 0;
  #1 a = 4'b0010; b = 4'b0001;
  #1 a = 4'd1;    b = 3;
  #1 a = 4'o5;    b = 2;
  #1 a = 4'hA;    b = 3;
  #1 a = 4'h9;    b = 4'o3;
  end
endmodule // testorgate
