// ------------------------- 
//--Construir a tabela_verdade para a porta AND com 3 entradas. 
//--Obs.: Usar expressão na definição do módulo.        
//----------------------------- 
// Exercicio08 - AND 
// Nome: Milton costa teles da silva
// Matricula: 002751-

// ---------------------
// -- and gate
// ---------------------

module andgate (s, p , q , v );
 output s;
 input  p , q , v ;

 assign s = p & q & v;

endmodule // andgate

// ---------------------
// -- test and gate
// ---------------------

module testandgate;
  reg   a , b , c ;
  wire  s;
//---------- instancia
 andgate AND1 (s , a , b , c);
 
 //---------parte principal

 initial begin:start 
a=0; b=0; c=0;
end 


 initial begin:main 
      $display("Exercicio08 -  Milton teles da silva - 002751");
      $display("Test AND gate");
      $display("\na & b & c  = s\n");
  
 $monitor("%b %b %b = %b" ,  a , b , c , s);     
      #1 a=0; b=0; c=1;
      #1 a=0; b=1; c=0;
      #1 a=0; b=1; c=1;
		#1 a=1; b=0; c=0;
		#1 a=1; b=0; c=1;
		#1 a=1; b=1; c=0;
		#1 a=1; b=1; c=1;
 end
endmodule // testnorgate
