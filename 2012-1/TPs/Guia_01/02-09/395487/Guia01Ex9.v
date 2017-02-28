// ---------------------------------------
// Guia 01 Ex9 - AND
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------------------------

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
 
 
          // parte principal

 initial begin:start 
a=0; b=0; c=0;
end 


 initial begin:main 
       $display("Guia 1 Exercicio 9 - Alvaro");
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
