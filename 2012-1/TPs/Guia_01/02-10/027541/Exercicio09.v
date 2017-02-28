// ------------------------- 
//--Construir a tabela_verdade para a porta AND com 3 entradas. 
//--Obs.: Criar um módulo que use outros módulos AND de 2 entradas         
//----------------------------- 
// Exercicio09 - AND 
// Nome: Milton costa teles da silva
// Matricula: 002751-
// ---------------------
// -- and gate
// ---------------------

module andgate (s, p, q );
      output s;
      input  p, q;

      assign s = p & q ;
  
endmodule // andgate

// ---------------------
// -- andTriplo gate
// ---------------------

module andTriplogate(s , p , q , t);
 input   p, q , t;
 wire tmp;
 output  s;
          // instancia
 andgate AND1 (tmp, p, q  );
 andgate AND2 (s , tmp , t  );
 
 endmodule // andTriplo
 

// ---------------------
// -- test and gate
// ---------------------

module testandTriplogate;
 reg   a, b , c;
 wire  s ;
          // instancia
 andTriplogate AND3 (s, a , b , c  );
 
 
//----------parte principal

 initial begin:start 
  a=0; b=0; c=0;
end 


 initial begin:main 
      $display("Exercicio09 -  Milton teles da silva - 002751");
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
endmodule // testnandgate
