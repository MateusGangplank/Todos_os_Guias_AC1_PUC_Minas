// --Exercicio 3
// --Nome: Gabriel Benjamim de Carvalho
// --Matricula: 396690


// --OR GATE

module orgate (s, p, q, t );
 output s;
 input  p, q, t ;

 assign s = ~p | ~q | ~t;

endmodule // --OR GATE

// -- TESTE OR GATE


module testeorgate;
 reg   a, b, c;
 wire  s;

orgate OR1 (s, a, b, c);
 
          
 initial begin
      $display("Exercicio 5 - Gabriel Benjamim de Carvalho - 396690");
      $display("Teste OR gate");
      $display("\na | b | c = s\n");
		$monitor("%b | %b | %b = %b", a, b,c, s); 
      #1 a=0; b=0;c=0;
      #1 a=0; b=0;c=1;
 		#1 a=0; b=1;c=0;
		#1 a=0; b=1;c=1;
		#1 a=1; b=0;c=0;
		#1 a=1; b=0;c=1;
		#1 a=1; b=1;c=0;
		#1 a=1; b=1;c=1;
 end

endmodule // testeorgate

/*
	TESTE
	Exercicio 5 - Gabriel Benjamim de Carvalho - 396690
    Teste OR gate
    
    a | b | c = s
    
    x | x | x = x
    0 | 0 | 0 = 1
    0 | 0 | 1 = 1
    0 | 1 | 0 = 1
    0 | 1 | 1 = 1
    1 | 0 | 0 = 1
    1 | 0 | 1 = 1
    1 | 1 | 0 = 1
    1 | 1 | 1 = 0

    
    
     ----jGRASP: operation complete.



*/
