// ------------------------- 
// Exemplo0017 - or 
// Nome: Thauan Velasco
// Matricula: 439995
// ------------------------- 

// --------------------- 
// -- or gate 
// --------------------- 
	module batata (output s, input [7:0] a); 
	or OR1 (s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);	
	endmodule // or

// --------------------- 
// -- teste
// --------------------- 

	module test; 

// ------------------------- dados locais 
	reg [7:0]a;
	wire s;
	batata BAT (s, a);

	

// ------------------------- preparacao 
	initial begin:start 
	a = 8'b11111111;

 
end
// ------------------------- parte principal 
	initial begin:main 
	$display("Exemplo0017 - Thauan Velasco - 439995"); 
	$display("Quest�o 12 - OR"); 
	#1	a = 8'b11111111;
	#1 $display("%8b = %b", a, s);
end


endmodule // testbatata 