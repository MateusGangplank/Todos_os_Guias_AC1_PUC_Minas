// -------------------------
// Exercicio07 -   
// Receber um byte e retornar 1, se algum de seus bits for igual a 1
// Nome: Thaise Souto Martins
// Matricula: 395504
// ------------------------- 
 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate (output s, input p, input q, input r, input t, input u, input v, input x, input z );
	assign s = p | q | r | q | r | t | u | v | x | z;
endmodule

module testorgate;
	reg a, b, c,d,e,f,g,h;
	wire  s;
	orgate OR1 (s, a,b,c,d,e,f,g,h);
	
	initial 
	begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0; 
		f = 0; 
		g = 0; 
		h = 0;
	end

	initial
	begin
		$display("Exercicio07 - Thaise Souto Martins - 395504"); 
      $display("Receber um byte e retornar 1, se algum de seus bits for igual a 1. Alguns Testes:"); 
      $display("\na | b | c | d | e | f | g | h = s\n"); 
      a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
		$monitor("%b | %b | %b | %b | %b | %b | %b = %b",a,b,c,d,e,f,g,h,s);
		#1 c=1;
		#1 b=1;
			c=0;
		#1	c=1;
		#1 a=1;
			b=0;
			c=0;
		#1 c=1;
		#1 c=0;
			b=1;
		#1 c=1;
		#1 a=1; b=1; d=1; e=1; f=1; g=1; h=1;
	end
	
endmodule
    // a | b | c | d | e | f | g | h = s
    // 
    // 0 | 0 | 0 | 0 | 0 | 0 | 0 = 00
    // 0 | 0 | 1 | 0 | 0 | 0 | 0 = 01
    // 0 | 1 | 0 | 0 | 0 | 0 | 0 = 01
    // 0 | 1 | 1 | 0 | 0 | 0 | 0 = 01
    // 1 | 0 | 0 | 0 | 0 | 0 | 0 = 01
    // 1 | 0 | 1 | 0 | 0 | 0 | 0 = 01
    // 1 | 1 | 0 | 0 | 0 | 0 | 0 = 01
    // 1 | 1 | 1 | 0 | 0 | 0 | 0 = 01
    // 1 | 1 | 1 | 1 | 1 | 1 | 1 = 11