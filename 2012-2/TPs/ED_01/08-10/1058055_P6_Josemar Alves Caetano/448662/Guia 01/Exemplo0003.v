// --------------
// Exemplo0003 - AND
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- and gate
// --------------
module andgate(output s, input p, input q);
 assign s = p & q;//Cria vínculo permanente

endmodule //andgate

// --------------
// --test and gate
// --------------
module testandgate;
//--------------- Dados locais
  reg a, b; //Definir registrador (Variável independente)
  wire s; //Definir conexão (fio) (Variável dependente)

// -------------- Instância
  andgate AND1(s, a, b);
  
// -------------- Preparação
  initial begin: start
    a = 0;
	 b = 0;
  end //start
  
// -------------- Parte principal
   initial begin: main
	     $display("Exemplo0003 - Josemar Alves Caetano - 448662");
		  $display("Teste AND gate:");
		  $display("\na & b = s\n");
	  
	  #1 $display("%b & %b = %b", a, b, s);
	     a = 0; b = 1;
	  #1 $display("%b & %b = %b", a, b, s);
	     a = 1; b = 0;
	  #1 $display("%b & %b = %b", a, b, s);
	     a = 1; b = 1;
	  #1 $display("%b & %b = %b", a, b, s);
		  
   end //main
	
endmodule //testandgate