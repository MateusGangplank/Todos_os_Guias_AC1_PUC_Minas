//-----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773	
//-----------------------------



//-----------------------------
//------ GUIA 02 - 02----------
//-----------------------------


module nandgate (s, a, b);
	
	output s;
	input  a, b;
	
	assign s = ~(a & b);
	
endmodule // fim nandgate

module testnotgate ;

	reg  a;
	wire s;
	
	nandgate NOT1(s, a, a);
	
	
	//programa
	
	initial begin 
	
		$display("\n Guia 02 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n Tabela - Verdade da Porta NOT, usando NAND");
		$display("\n a  = ~s\n");
		
		
	#1	a = 0;	
		$monitor(" %b = %b", a, s);	
	#1	a = 1;
	
		
	end

endmodule // fim testnotgate

/*Teste:
Guia 02 - Silvino Henrique Santos de Souza - 412773 
    
     Tabela - Verdade da Porta NOT, usando NAND
    
     a  = ~s
    
     0 = 1
     1 = 0*/