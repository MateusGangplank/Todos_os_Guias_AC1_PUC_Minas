// ------------------------- 
// Exemplo0022 - BASE 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q07 (output [7:0]s, input [7:0]a);
	assign s = ~a + 1;
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [7:0] a;	
	wire [7:0] sA;
	
	Q07 questao07(sA, a); 
	
initial begin: start
	a = 8'b01010101; 
end
	
// ------------------------- parte principal 
initial begin
	$display("Exemplo0022 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	 
	#1
	$display("\nQuestao 07)");
	$display("%b = %b", a, sA);

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0022 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Questao 07)
    01010101 = 10101011
*/