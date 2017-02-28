// -------------------------
// Exemplo0003 - AND
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate (output s, input p, input q);
assign s = p & q; // criar vínculo permanente
              // (dependência)
endmodule // andgate

// -------------------------
// -- test and gate
// -------------------------
module testandgate;
// ------------------------- dados locais
reg a, b;   // definir registrador
         // (variável independente)
wire s;  // definir conexao (fio)
         // (variável dependente)
// ------------------------- instância
andgate AND1 (s, a, b);
// ------------------------- preparação
initial begin:start
          // atribuição simultânea dos valores iniciais
a=0; b=0;			 
end

// ------------------------- parte principal
initial begin:main
     $display("Exemplo 0003 - Breno Macena - 462017");
     $display("Test AND gate:");
     $display("\na & b = s\n");
     a=0; b=0;
#1   $display("%b & %b = %b", a, b, s);
     a=0; b=1;
#1   $display("%b & %b = %b", a, b, s);		
     a=1; b=0;
#1   $display("%b & %b = %b", a, b, s);		
     a=1; b=1;
#1   $display("%b & %b = %b", a, b, s);		
end
endmodule // testandgate












