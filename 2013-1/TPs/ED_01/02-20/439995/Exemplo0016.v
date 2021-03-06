// ------------------------- 
// Exemplo0016 - nor 
// Nome: Thauan Velasco
// Matricula: 439995
// ------------------------- 

// --------------------- 
// -- nor gate 
// --------------------- 
	module batata (output s, input [7:0] a); 
	nor NOR1 (s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);	
	endmodule // nor

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
	a = 8'b00000000;

 
end
// ------------------------- parte principal 
	initial begin:main 
	$display("Exemplo0016 - Thauan Velasco - 439995"); 
	$display("Quest�o 11 - NOR"); 
	#1	a = 8'b00000000;
	#1 $display("%8b = %b", a, s);
end


endmodule // testbatata 