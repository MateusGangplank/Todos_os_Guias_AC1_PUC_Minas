// ----------------------------------------------------------
// Exercício 001 - BASE
// Débora Deslandes de Almeida Batista
// Matrícula : 451549
// ----------------------------------------------------------

// ----------------------------------------------------------
// -- teste base number
// ----------------------------------------------------------

module binario01 ;

// -- definir tamanho dos registradores

	reg [0:4] a;
	reg [0:4] b;
	reg [0:2] c;
	reg [0:3] d;
	reg [0:4] e;

// -- parte principal

	initial begin: main
		$display ("Exercicio 001 - Débora Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Teste number ");

// -- inicializar as variáveis
		a = 3+14;
		b = 3*8;
		c = 33/5;
		d = 25-11;
		e = 2*8+7-1;

		$display ("Valores na base 2");
		$display ("\na = %d = %5b" ,a,a);
                $display ("\nb = %d = %5b" ,b,b);
                $display ("\nc = %d = %3b" ,c,c);
                $display ("\nd = %d = %4b" ,d,d);
                $display ("\ne = %d = %5b" ,e,e);
	end
endmodule
