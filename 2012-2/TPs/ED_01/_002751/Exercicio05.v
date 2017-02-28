// ------------------------- 
//--Construir a tabela_verdade para a porta NOR com 2 entradas. 
//--Obs.: Usar na definição do módulo a propriedade de Morgan.     
//----------------------------- 
// Exercicio05 - NOR 
// Nome: Milton costa teles da silva
// Matricula: 002751

// ---------------------
// -- nor gate
// ---------------------

module norgate (output s, input p, input q );
 assign s = ( ~p  & ~q );

endmodule // norgate

// ---------------------
// -- test nor gate
// ---------------------

module testnorgate;
 reg   a, b;
 wire  s;
//--------------instancia
 norgate NOR1 (s, a, b);
 
//---------------parte principal

 initial begin:start 
a=0; b=0;
end 


 initial begin:main 
      $display("Exercicio05 -  Milton teles da silva - 002751");
      $display("Test NOR gate");
      $display("\na ~| b  = s\n");
  
 $monitor("%b ~| %b = %b" ,  a , b , s);     
      #1 a=0; b=1;
      #1 a=1; b=0;
      #1 a=1; b=1;
 
 end
endmodule // testnorgate
