// ---------------------------------------
// Guia 01 Ex10 - OR
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------------------------

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
 
          // parte principal

 initial begin:start 
a=0; b=0; c=0;
end 


 initial begin:main 
       $display("Guia 1 Exercicio 10 - Alvaro");
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
