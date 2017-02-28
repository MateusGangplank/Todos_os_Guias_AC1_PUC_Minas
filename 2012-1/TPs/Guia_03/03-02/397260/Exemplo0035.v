//
// Exemplo0035 - F4 
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
//
//
// f4_gate 
//
module f4 (output s, input x, input y, input z, input w, input t); 
	 
	assign s = (~x & ~y & ~t) | (~x & y & ~w) | (x & ~y & ~w) | (x & y & ~z & t) | (x & y & z & w);
	
endmodule // f4 
	
module test_f4; 
	// definir dados 
	
	reg x; 
	reg b;
	reg z;
	reg w;
	reg t;
	
	wire s; 
	
	f4 modulo1 (s, x, y, z, w, t); 
	
	// parte principal 
	initial begin 
	
		$display("Exemplo0035 - Pedro Henrique Hardeman Guedes - 397260"); 
		$display("Test LU's module"); 
		x = 1; y = 0; z = 0; w = 0; t = 1;
	
	
	// projetar testes do modulo 
	$display("X  Y  Z  W  T  S");
	$monitor("%b  %b  %b  %b  %b  %b",x, y, z, w, t, s);
	#1 x = 0; y = 1; z = 1; w = 0; t = 0;
	#1 x = 1; y = 0; z = 0; w = 1; t = 1;
	#1 x = 0; y = 1; z = 1; w = 1; t = 0;
	
	end 
endmodule // test_f4 

// OBS.: DAR PREFERENCIA 'AS DESCRICOES POR PORTAS.