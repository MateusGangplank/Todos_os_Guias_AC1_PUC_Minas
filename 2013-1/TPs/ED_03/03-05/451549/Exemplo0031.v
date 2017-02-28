// ------------------------- 
// Exemplo0031 - F4 
// Nome: Débora Deslandes de Almeida 
// Matricula: 451549 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (s1,s2,a,b);
	
	output[3:0] s1;
	output[3:0] s2;
	
	input[3:0] a;
	input[3:0] b;	 
	
	assign s1 = a&b;
	assign s2 = a|b;
	
endmodule
// -------------------------
// test module f4
// -------------------------

module testf4;
	reg [3:0]a;
	reg [3:0]b;
	
	wire [3:0]s1;
	wire [3:0]s2;
	
	f4 banana (s1,s2,a,b);
	
	initial begin: main
		$display ("Exemplo 0031 - Débora  Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Test LU's module ");
		a = 4'b0011;
		b = 4'b0101;
		
		//testes
		#1 $display("%3b\n%3b\n%3b\n%3b",a,b,s1,s2);
	end
endmodule
		