// --Exercicio 3
// --Nome: Gabriel Benjamim de Carvalho
// --Matricula: 396690


// --XNOR GATE

module xnorgate (s, p, q );
 output s;
 input  p, q ;

 assign s = ~(p ^ q );

endmodule // --XNOR GATE

// -- TESTE XNOR GATE


module testexnorgate;
 reg   a, b;
 wire  s;

 xnorgate XNOR1 (s, a, b);
 
          
 initial begin
      $display("Guia 01 - Gabriel Benjamim de Carvalho - 396690");
      $display("Teste XNOR gate");
      $display("\na ^ b = s\n");
		$monitor("%b ^ %b = %b", a, b, s); 
      #1 a=0; b=0;
      #1 a=0; b=1;
 		#1 a=1; b=0;
		#1 a=1; b=1;
 end

endmodule // testexnorgate

/*
	TESTE
	
    
   Guia 01 - Gabriel Benjamim de Carvalho - 396690
    Teste XNOR gate
    
    a ^ b = s
    
    x ^ x = x
    0 ^ 0 = 1
    0 ^ 1 = 0
    1 ^ 0 = 0
    1 ^ 1 = 1
    
     ----jGRASP: operation complete.



*/
