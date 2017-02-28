// --Exercicio 2
// --Nome: Gabriel Benjamim de Carvalho
// --Matricula: 396690


// --NOR GATE

module norgate (s, p, q );
 output s;
 input  p, q ;

 assign s = ~(p | q );

endmodule // --NOR GATE

// -- TESTE NOR GATE


module testenorgate;
 reg   a, b;
 wire  s;

 norgate NOR1 (s, a, b);
 
          
 initial begin
      $display("Guia 01 - Gabriel Benjamim de Carvalho - 396690");
      $display("Teste NOR gate");
      $display("\na | b = s\n");
		$monitor("%b | %b = %b", a, b, s); 
      #1 a=0; b=0;
      #1 a=0; b=1;
 		#1 a=1; b=0;
		#1 a=1; b=1;
 end

endmodule // testenandgate

/*
	TESTE
	
    
    Guia 01 - Gabriel Benjamim de Carvalho - 396690
    Teste NOR gate
    
    a | b = s
    
    x ^ x = x
    0 ^ 0 = 1
    0 ^ 1 = 0
    1 ^ 0 = 0
    1 ^ 1 = 0    
     ----jGRASP: operation complete.



*/
