// --------------
// Exemplo0002 - NOT
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- not gate
// --------------
module notgate(output s, input p);
 assign s = ~p;//Cria v�nculo permanente

endmodule //notgate

// --------------
// --test not gate
// --------------
module testnotgate;
//--------------- Dados locais
  reg a; //Definir registrador (Vari�vel independente)
  wire s; //Definir conex�o (fio) (Vari�vel dependente)

// -------------- Inst�ncia
  notgate NOT1(s, a);
  
// -------------- Prepara��o
  initial begin: start
    a = 0;
  end //start
  
// -------------- Parte principal
   initial begin: main
	  //Execu��o unit�ria  
	     $display("Exemplo0002 - Josemar Alves Caetano - 448662");
		  $display("Teste NOT gate:");
		  $display("\n~a = s\n");
	     a = 0; //N�o � necess�rio pois j� foi atribu�do no bloco start
	  
	  #1 $display("~%b = %b", a, s);
	     a = 1;
	  #1 $display("~%b - %b", a, s);
		  
   end //main
	
endmodule //testnotgate