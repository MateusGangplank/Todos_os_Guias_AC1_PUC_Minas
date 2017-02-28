// Exemplo0004- OR
// Nome : Julio Mirnada Machado
// Matricula: 435666


// or gate

module orgate (output s, input p, input q); 
	assign s = p|q ; 
endmodule // orgate

// Test or Gate 

module testorgate;
reg a , b;
wire s;

orgate OR1(s,a,b);
	
	initial begin:start
		a=0;b=0;
end
	initial begin
		$display("Exemplo0004 Julio Machado - 435666");
		$display("Test OR gate");
		$display("\na|b=s\n");
		a=0;b=0;
	#1 $display("%b | %b = %b", a, b, s); 
		a=0; b=1; 
	#1 $display("%b | %b = %b", a, b, s); 
		a=1; b=0; 
	#1 $display("%b | %b = %b", a, b, s); 
		a=1; b=1; 
	#1 $display("%b | %b = %b", a, b, s); 

	end
endmodule // testorgate