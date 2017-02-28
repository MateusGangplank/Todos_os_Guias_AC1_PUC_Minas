//Exemplo0015
//Nome: Eduardo Botelho
//Matricula: 427395

//Complements
module complement (output s, input a);
	//propriedades
	assign s = ~a + 1'b1;
endmodule
 
 
 
//Test-Complements    
module test_complement;
	
	//Dados locais
	reg [3:0] a;
	wire [3:0] s;	
	//Instancia
	complement C2 (s,a);
	
	//execucao
	initial begin: main
	a = 2'b01;
	
	$display("Complements - Author: Eduardo Botelho");
	$display("s = %d = %b",s,s);
	a = 2'b10;
	$display("s = %d = %b",s,s);
	a = 2'b11;
	$display("s = %d = %b",s,s);
	end
endmodule
	
