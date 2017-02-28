// ------------------------- 
// Exemplo0021 - BASE 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q06 (output [7:0]s, input [7:0]a);
	assign s = ~a;
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [7:0] a;	
	wire [7:0] sA;
	
	Q06 questao06(sA, a); 
	
initial begin: start
	a = 8'b10101010; 
end
	
// ------------------------- parte principal 
initial begin
	$display("Exemplo0021 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	 
	#1
	$display("\nQuestao 06)");
	$display("%b = %b", a, sA);

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0021 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Questao 06)
    10101010 = 01010101
*/