//
// Exemplo0033 - F4 
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
//
//
//
// f4_gate 
//
module f4 (output s, input x, input y, input z, input w);  
	
	assign s = (y & ~z & w) | (y & z & ~w) | (x & ~z & ~w) | (x & z & w);
	
endmodule // f4 
	
module test_f4; 
	// definir dados 
	
	reg x; 
	reg y;
	reg z;
	reg w;
	
	wire s; 
	
	f4 modulo1 (s, x, y, z, w); 
	

	// parte principal
	initial begin 
		$display("Pedro Henrique Hardeman Guedes - 397260"); 
		$display("Test LU's module"); 
		
	x = 1; y = 0; z = 0; w = 0;
	
	
	// projetar testes do modulo 
	$display("S1 S2 C SE S");
	$monitor("%b  %b  %b  %b  %b",x, y, z, w, s);
	#1 x = 0; y = 1; z = 1; w = 0;
	#1 x = 1; y = 0; z = 0; w = 1;
	#1 x = 0; y = 1; z = 1; w = 1;
	
	end 
endmodule // test_f4 