// Extra 11
// Nome : Julio Mirnada Machado
// Matricula: 435666


// and gate

module andgate (output [0:7]s, input [0:7]p, input [0:7]q); 
	assign s = ( ~(p&q)) ; 
endmodule // andgate

// Test and gate 

module testandgate;
reg [0:7]a , b;
wire [0:7]s;

andgate AND1(s,a,b);
	
	initial begin:start
		a=8'b00000000; b=8'b00000000;
end
	initial begin
		$display("Extra11 Julio Machado - 435666");
		$display("Test AND gate");
		
		$monitor("%b & %b = %b", a, b, s);	

	end
endmodule // testandgate