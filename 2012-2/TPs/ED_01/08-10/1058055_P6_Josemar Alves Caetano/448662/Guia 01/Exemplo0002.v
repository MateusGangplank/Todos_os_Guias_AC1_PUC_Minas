// --------------
// Exemplo0002 - NOT
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- not gate
// --------------
module notgate(output s, input p);
 assign s = ~p;//Cria vínculo permanente

endmodule //notgate

// --------------
// --test not gate
// --------------
module testnotgate;
//--------------- Dados locais
  reg a; //Definir registrador (Variável independente)
  wire s; //Definir conexão (fio) (Variável dependente)

// -------------- Instância
  notgate NOT1(s, a);
  
// -------------- Preparação
  initial begin: start
    a = 0;
  end //start
  
// -------------- Parte principal
   initial begin: main
	  //Execução unitária  
	     $display("Exemplo0002 - Josemar Alves Caetano - 448662");
		  $display("Teste NOT gate:");
		  $display("\n~a = s\n");
	     a = 0; //Não é necessário pois já foi atribuído no bloco start
	  
	  #1 $display("~%b = %b", a, s);
	     a = 1;
	  #1 $display("~%b - %b", a, s);
		  
   end //main
	
endmodule //testnotgate