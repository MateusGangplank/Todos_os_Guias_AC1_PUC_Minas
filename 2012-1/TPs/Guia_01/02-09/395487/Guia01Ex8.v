// ---------------------------------------
// Guia 01 Ex8 - AND
// Nome:�lvaro Henrique de Ara�jo Rungue
// Matricula: 395487
// ---------------------------------------

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
          // instancia
 andgate AND1 (s , a , b , c);
 
          // parte principal

 initial begin:start 
a=0; b=0; c=0;
end 


 initial begin:main 
       $display("Guia 1 Exercicio 8 - Alvaro");
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
