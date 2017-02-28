// -------------------------
// Exemplo0002 - NOT
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- not gate
// -------------------------
module notgate (output s, input p);
assign s = ~p; // criar v�nculo permanente
              // (depend�ncia)
endmodule // notgate

// -------------------------
// -- test not gate
// -------------------------
module testnotgate;
// ------------------------- dados locais
reg a;   // definir registrador
         // (vari�vel independente)
wire s;  // definir conexao (fio)
         // (vari�vel dependente)
// ------------------------- inst�ncia
notgate NOT1 (s, a);
// ------------------------- prepara��o
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












