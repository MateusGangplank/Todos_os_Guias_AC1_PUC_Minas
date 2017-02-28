// Exemplo0003- AND
// Nome : Julio Mirnada Machado
// Matricula: 435666


// and gate

module andgate (output s, input p, input q); 
	assign s = p&q ; 
endmodule // andgate

// Test and Gate 

module testandgate;
reg a , b;
wire s;

andgate AND1(s,a,b);
	
	initial begin:start
		a=0;b=0;
end
	initial begin
		$display("Exemplo0003 Julio Machado - 435666");
		$display("Test AND gate");
		$display("\na&b=s\n");
		a=0;b=0;
	#1 $display("%b & %b = %b", a, b, s); 
		a=0; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=0; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 

	end
endmodule // testandgate