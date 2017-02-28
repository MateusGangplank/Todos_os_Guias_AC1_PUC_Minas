// ------------------------- 
// Exercicio 0002 
// Nome: Guilherme Gideoni Albinati Batista 
// Matricula: 451565
// ------------------------- 
// ------------------------- 

// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
	reg [6:0] a; 
	reg [5:0] b; 
	reg [3:0] d;
	reg [6:0] e; 
	reg [9:0] f;
	// ------------------------- parte principal 
	initial begin 
		$display("Exercicio0002 - Guilherme Gideoni Albinati Batista - 451565"); 
		$display("Operacoes");
		

	a='b100110 + 'b11011; 
	$display("a = %d = %7b", a, a);
	b='b11101 + 'o25; 
	$display("b = %d = %6b", b, b);
	d='o1234 / 'h4C; 
	$display("d = %d = %3b", d, d);
	e='h1BA - 'b101110011; 
	$display("e = %d = %4b", e, e);
	f=25 * 'o32 + 'h8A; 
	$display("f = %d = %11b", f, f); 
		  
	end 
endmodule

/*
Exercicio0002 - Guilherme Gideoni Albinati Batista - 451565
Operacoes
a =  65 = 1000001
b = 50 = 110010
d =  8 = 1000
e =  71 = 1000111
f =  788 =  1100010100
*/