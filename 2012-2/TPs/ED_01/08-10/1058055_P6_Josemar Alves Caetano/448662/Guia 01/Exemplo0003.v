// --------------
// Exemplo0003 - AND
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- and gate
// --------------
module andgate(output s, input p, input q);
 assign s = p & q;//Cria v�nculo permanente

endmodule //andgate

// --------------
// --test and gate
// --------------
module testandgate;
//--------------- Dados locais
  reg a, b; //Definir registrador (Vari�vel independente)
  wire s; //Definir conex�o (fio) (Vari�vel dependente)

// -------------- Inst�ncia
  andgate AND1(s, a, b);
  
// -------------- Prepara��o
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