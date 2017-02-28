// Exercicio 10 - OR com 3 entradas
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- or gate 
// ------------------------- 
module simpleorgate(output s, input p, input q);
	assign s = p|q;
endmodule

module orgate(output s,input p,input q, input r);
	wire aux;
	simpleorgate OR1(aux,p,q);
	assign s = aux | r;
endmodule

// ------------------------- 
// -- test or gate 
// ------------------------- 
module testorgate; 
	reg a,b,c; 	 
	wire s; 
	orgate OR2 (s, a, b, c); 
	
	initial begin:start 
		a=0;b=0;c=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exercicio 10 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test OR Gate com 3 entradas:"); 
		$display("\na | b | c = s\n");
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=0;b=0;c=1;
		#1 a=0;b=1;c=0;
		#1 a=1;b=0;c=0;
		#1 a=1;b=1;c=0;
		#1 a=1;b=0;c=1;
		#1 a=0;b=1;c=1;
		#1 a=1;b=1;c=1; 
	end 
endmodule 