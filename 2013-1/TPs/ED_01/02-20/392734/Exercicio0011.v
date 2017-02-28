// ----------------------------------------
// Exercício0011 - EXTRA
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------
// -- or gate
// -------------------

module orgate01 (output s1, input p1, input q1, input r1, input t1);
	assign s1 = p1 | q1 | r1 | t1;
endmodule //-- orgate 
        
module orgate02 (output s2, input p2, input q2, input r2, input t2);
	assign s2 = p2 | q2 | r2 | t2;
endmodule //-- orgate 

// -------------------
// -- nor gate
// -------------------

module norgate(output s, input s1,input s2);
	assign s = ~(s1 | s2); 
endmodule //-- norgate

// -------------------
// -- test circuito
// -------------------

module testcircuito;
	reg a, b, c, d, e, f, g, h;
	wire s, s1, s2; 
 
	orgate01 OR1(s1, a, b, c, d); 
	orgate02 OR2(s2, e, f, g, h);
	norgate NOR1(s, s1, s2);  

	initial begin:start
		a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; 
	end //-- start
 
	initial begin:main
		$display("Exercício0011 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test circuito _ Alguns Exemplos"); 
		$display("\na b c d e f g h = s\n");
		$monitor("%b %b %b %b %b %b %b %b = %b", a, b, c, d, e, f, g, h, s);
		
	#1 a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
	#1 a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 1;
	#1 a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 1; h = 0;
	#1 a = 0; b = 0; c = 0; d = 0; e = 0; f = 1; g = 0; h = 0;
	#1 a = 0; b = 0; c = 0; d = 0; e = 1; f = 0; g = 0; h = 0;
	#1 a = 0; b = 0; c = 0; d = 1; e = 0; f = 0; g = 0; h = 0;
	#1 a = 0; b = 0; c = 1; d = 0; e = 0; f = 0; g = 0; h = 0;
	#1 a = 0; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
	#1 a = 1; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
	
	end //-- main
  
endmodule //-- testcircuito