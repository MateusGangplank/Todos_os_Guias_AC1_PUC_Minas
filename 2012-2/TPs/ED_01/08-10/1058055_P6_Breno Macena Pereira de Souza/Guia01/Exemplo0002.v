// -------------------------
// Exemplo0002 - NOT
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- not gate
// -------------------------
module notgate (output s, input p);
assign s = ~p; // criar vínculo permanente
              // (dependência)
endmodule // notgate

// -------------------------
// -- test not gate
// -------------------------
module testnotgate;
// ------------------------- dados locais
reg a;   // definir registrador
         // (variável independente)
wire s;  // definir conexao (fio)
         // (variável dependente)
// ------------------------- instância
notgate NOT1 (s, a);
// ------------------------- preparação
initial begin:start
a=0;  // valor inicial
end

// ------------------------- parte principal
initial begin:main
     $display("Exemplo 0002 - Breno Macena - 462017");
     $display("Test NOT gate:");
     $display("\n~a = s\n");
     a=0;
#1   $display("~%b = %b", a, s);
     a=1;
#1   $display("~%b = %b", a, s);		
end
endmodule // testnotgate












