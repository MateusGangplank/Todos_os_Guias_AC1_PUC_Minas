 // ------------------------- 
// Exemplo0022 - COMPLEMENTO DE 2 
// Nome: Rafael Santos Moura 
// Matricula: 441705 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module EX07 (output [7:0]s, input [7:0]a);
	assign s = ~a + 1;
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [7:0] a;	
	wire [7:0] sA;
	
	EX07 questao07(sA, a); 
	
initial begin: start
	a = 8'b01010101; 
end

// ------------------------- parte principal 
initial begin
	$display("Exemplo0022 - Rafael Santos Moura - 441705"); 
	$display("Test number system"); 
	 
		#1
	$display("\nQuestao 07)");
	$display("%b = %b", a, sA);

end 
endmodule // test_base 
