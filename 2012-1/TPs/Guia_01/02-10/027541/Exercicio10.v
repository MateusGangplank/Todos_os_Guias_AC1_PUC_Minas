// ------------------------- 
//--Construir a tabela_verdade para a porta OR com 3 entradas. 
//--Obs.: Criar um módulo que use outros módulos OR de 2 entradas.        
//----------------------------- 
// Exercicio10 - OR 
// Nome: Milton costa teles da silva
// Matricula: 002751

// ---------------------
// -- or gate
// ---------------------

module orgate (s, p, q );
 output s;
 input  p, q;

 assign s = p | q ;

endmodule // orgate

// ---------------------
// -- orTriplo gate
// ---------------------

module orTriplogate(s , p , q , t);
 input   p, q , t;
 wire tmp;
 output  s;
          // instancia
 orgate OR1 (tmp, p, q  );
 orgate OR2 (s , tmp , t  );
 
 endmodule // orTriplo
 

// ---------------------
// -- test or gate
// ---------------------

module testorTriplogate;
 reg   a, b , c;
 wire  s ;
          // instancia
 orTriplogate OR3 (s, a , b , c  );
 
//-----------parte principal

 initial begin:start 
a=0; b=0; c=0;
end 


 initial begin:main 
      $display("Exercicio10 -  Milton teles da silva - 002751");
      $display("Test OR gate");
      $display("\na | b | c  = s\n");
  
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
