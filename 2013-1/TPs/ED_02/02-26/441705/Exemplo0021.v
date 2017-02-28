 // ------------------------- 
// Exemplo0021 - COMPLEMENTO DE 1 
// Nome: Rafael Santos Moura 
// Matricula: 441705 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module EX06 (output [7:0]s, input [7:0]a);
	assign s = ~a;
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [7:0] a;	
	wire [7:0] sA;
	
	EX06 questao06(sA, a); 
	
initial begin: start
	a = 8'b10101010; 
end

// ------------------------- parte principal 
initial begin
	$display("Exemplo0021 - Rafael Santos Moura - 441705"); 
	$display("Test number system"); 
	 
		#1
	$display("\nQuestao 06)");
	$display("%b = %b", a, sA);

end 
endmodule // test_base 
