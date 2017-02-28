// -------------------------
// Exemplo0001 - buffer
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- buffer
// -------------------------
module buffer (output s, input p);
assign s = p; // criar v�nculo permanente
              // (depend�ncia)
endmodule // buffer

// -------------------------
// -- test buffer
// -------------------------
module testbuffer;
// ------------------------- dados locais
reg a;   // definir registrador
         // (variavel independente)
wire s;  // definir conexao (fio)
         // (vari�vel dependente)
// ------------------------- inst�ncia
buffer BF1 (s, a);
// ------------------------- prepara��o
initial begin:start
a=0;  // valor inicial
end

// ------------------------- parte principal
initial begin:main
      // execu��o unit�tria
$display("Exemplo 0001 - Breno Macena - 462017");
$display("Test buffer:");
$display("\t       time\ta = s");
      // execu��o permanente
$monitor("%d\t%b = %b", $time, a, s);
      // ap�s uma unidade de tempo
		// mudar valor do registrador para 0
#1 a=1;
      // ap�s duas unidades de tempo
		// mudar valor do registrador para 1
#2 a=0;		
end
endmodule // testbuffer












