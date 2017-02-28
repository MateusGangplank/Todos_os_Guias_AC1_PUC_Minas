// --------------
// Exemplo0001 - buffer
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- buffer
// --------------
module buffer(output s, input p);
 assign s = p; //Criar v�nculo permanente (depend�ncia)

endmodule //buffer

// --------------
// -- test buffer
// --------------
module testbuffer;
// -------------- Dados locais
 reg a; //Definir registrador (vari�vel independente)
 wire s; //Definir conex�o (fio) (vari�vel dependente)
 
// -------------- Int�ncia
 buffer BF1(s, a);

// -------------- Prepara��o
 initial begin: start
  a = 0; //Valor inicial
 end
 
// -------------- Parte principal
 initial begin: main
   //Execu��o unit�ria
  $display("Exemplo0001 - Josemar Alves Caetano - 448662");
  $display("Test buffer:");
  $display("\t time\ta = s");
   //Execu��o permanente
  $monitor("%d\t%b = %b", $time, a, s);
   //Ap�s uma unidade de tempo
	//Mudar valor do registrador para 1.
 #1 a = 1;
   //Ap�s duas unidades de tempo
	//Mudar valor do registrador para 0.
 #2 a = 0;
 
 end //begin
 
 endmodule //testbuffer
