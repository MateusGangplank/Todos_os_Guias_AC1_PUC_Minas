// -------------------------
// Exemplo0001 - buffer
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- buffer
// -------------------------
module buffer (output s, input p);
assign s = p; // criar vínculo permanente
              // (dependência)
endmodule // buffer

// -------------------------
// -- test buffer
// -------------------------
module testbuffer;
// ------------------------- dados locais
reg a;   // definir registrador
         // (variavel independente)
wire s;  // definir conexao (fio)
         // (variável dependente)
// ------------------------- instância
buffer BF1 (s, a);
// ------------------------- preparação
initial begin:start
a=0;  // valor inicial
end

// ------------------------- parte principal
initial begin:main
      // execução unitátria
$display("Exemplo 0001 - Breno Macena - 462017");
$display("Test buffer:");
$display("\t       time\ta = s");
      // execução permanente
$monitor("%d\t%b = %b", $time, a, s);
      // após uma unidade de tempo
		// mudar valor do registrador para 0
#1 a=1;
      // após duas unidades de tempo
		// mudar valor do registrador para 1
#2 a=0;		
end
endmodule // testbuffer












