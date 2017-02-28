// ---------------------
// Guia 01 Ex2 - NOR
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module norgate (s, p, q );
 output s;
 input  p, q ;

 assign s = ~(p  | q );

endmodule // norgate

// ---------------------
// -- test nor gate
// ---------------------

module testnorgate;
 reg   a, b;
 wire  s;
          // instancia
 norgate NOR1 (s, a, b);
 
          // parte principal

 initial begin:start 
a=0; b=0;
end 


 initial begin:main 
       $display("Guia 1 Exercicio 2 - Alvaro");
      $display("Test NOR gate");
      $display("\na | b  = s\n");
  
 $monitor("%b %b = %b" ,  a , b , s);     
      #1 a=0; b=1;
      #1 a=1; b=0;
      #1 a=1; b=1;
 
 end

endmodule // testnorgate
