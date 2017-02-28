// ------------------------- 
//--Construir a tabela_verdade para a porta OR com 3 entradas. 
//-- Usar na definição do módulo a propriedade de Morgan.  
//----------------------------- 
// Exercicio04 - OR 
// Nome: Milton costa teles da silva
// Matricula: 2751
// ------------------------- 
// ------------------------- 
// -- or gate 
// -------------------------
module orgate ( output s, input a, b, c); 
  assign s = ~(~(a|b|c))  ; 
endmodule // orgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
   reg a, b, c; // definir registradores 
   wire s; // definir conexao (fio) 
// ------------------------- instancia 
   orgate OR1 (s, a, b, c); 
// ------------------------- preparacao 
   initial begin:start
     a=0; b=0; c=0; 
   end 
// ------------------------- parte principal 
   initial begin:main 
     $display("Exercicio04 -  Milton teles da silva - 2751"); 
     $display("Test OR gate"); 
     $display("a|b|c = s"); 
     $monitor("%b %b %b = %b", a, b, c, s);
	    #1 a=1; b=0; c=0;
		 #1 a=0; b=1; c=0;
		 #1 a=0; b=0; c=1;
		 #1 a=1; b=1; c=0;
		 #1 a=1; b=0; c=1;
		 #1 a=0; b=1; c=1;
		 #1 a=1; b=1; c=1;
    end 
endmodule // testorgate 
