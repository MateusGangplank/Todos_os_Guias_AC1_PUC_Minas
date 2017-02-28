// -------------------------
// Exemplo0004 - OR
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- or gate
// -------------------------
module orgate (output s, input p, input q);
assign s = p | q; // criar vínculo permanente
              // (dependência)
endmodule // orgate

// -------------------------
// -- test or gate
// -------------------------
module testorgate;
// ------------------------- dados locais
reg a, b;   // definir registrador
         // (variável independente)
wire s;  // definir conexao (fio)
         // (variável dependente)
// ------------------------- instância
orgate OR1 (s, a, b);
// ------------------------- preparação
initial begin:start
          // atribuição simultânea dos valores iniciais
a=0; b=0;			 
end

// ------------------------- parte principal
initial begin:main
     $display("Exemplo 0004 - Breno Macena - 462017");
     $display("Test OR gate:");
     $display("\na | b = s\n");
     a=0; b=0;
#1   $display("%b | %b = %b", a, b, s);
     a=0; b=1;
#1   $display("%b | %b = %b", a, b, s);		
     a=1; b=0;
#1   $display("%b | %b = %b", a, b, s);		
     a=1; b=1;
#1   $display("%b | %b = %b", a, b, s);		
end
endmodule // testorgate












