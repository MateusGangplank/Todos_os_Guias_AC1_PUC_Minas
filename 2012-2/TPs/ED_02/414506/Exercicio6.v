//----------------
//Exercicio6 - complemento de 1
//Nome:Fernando dos Santos Silva Silva
//Matricula:414506
//----------------


module exercicio3(input [7:0]a,output [7:0]b);
//----------------Definir dados

  not NOT1[7:0](b,a);
	
endmodule
//----------------parte principal

module test;
 reg  [7:0]x;
 wire [7:0]y;
 
exercicio3 exerc(x,y);
initial begin

    $display("Exercicio5 - Fernando dos Santos Silva - 414506");
	 
	 #1 x=8'b10101000;
	 $monitor("%8b",y);
	 #1 x=8'b11010101; 
	 	 
	 
	
	end
	
	endmodule //exercicio1
	 