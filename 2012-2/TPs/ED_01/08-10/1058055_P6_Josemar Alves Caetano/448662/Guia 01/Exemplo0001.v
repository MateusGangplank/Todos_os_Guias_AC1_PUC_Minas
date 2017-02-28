// --------------
// Exemplo0001 - buffer
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- buffer
// --------------
module buffer(output s, input p);
 assign s = p; //Criar vínculo permanente (dependência)

endmodule //buffer

// --------------
// -- test buffer
// --------------
module testbuffer;
// -------------- Dados locais
 reg a; //Definir registrador (variável independente)
 wire s; //Definir conexão (fio) (variável dependente)
 
// -------------- Intância
 buffer BF1(s, a);

// -------------- Preparação
 initial begin: start
  a = 0; //Valor inicial
 end
 
// -------------- Parte principal
 initial begin: main
   //Execução unitária
  $display("Exemplo0001 - Josemar Alves Caetano - 448662");
  $display("Test buffer:");
  $display("\t time\ta = s");
   //Execução permanente
  $monitor("%d\t%b = %b", $time, a, s);
   //Após uma unidade de tempo
	//Mudar valor do registrador para 1.
 #1 a = 1;
   //Após duas unidades de tempo
	//Mudar valor do registrador para 0.
 #2 a = 0;
 
 end //begin
 
 endmodule //testbuffer
