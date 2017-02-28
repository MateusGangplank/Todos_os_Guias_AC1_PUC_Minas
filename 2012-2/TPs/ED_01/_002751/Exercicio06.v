// ------------------------- 
//--Construir a tabela_verdade para a porta XOR com 2 entradas. 
//--Obs.: Usar a expressão: a'b+a b' na definição do módulo.      
//----------------------------- 
// Exercicio06 - XOR 
// Nome: Milton costa teles da silva
// Matricula: 002751

// ---------------------
// -- xor gate
// ---------------------

module xorgate (output s, input p, input q );
 assign s = ( ~p&q | p&~q );

endmodule // xorgate

// ---------------------
// -- test xor gate
// ---------------------

module testxorgate;
 reg   a, b;
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b  );
 
          // parte principal
 initial begin
      $display("Exercicio06 -  Milton teles da silva - 002751");
	   $display("Test xor gate");
      $display("\na ^ b  = s\n");
      a=0; b=0;
      $monitor("%b ^ %b  = %b", a , b , s);
   #1 a=0; b=1;
   #1 a=1; b=0;
   #1 a=1; b=1;
  

 end
endmodule // testnandgate
