//-----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//-----------------------------



//-----------------------------
//------ GUIA 02 - 02----------
//-----------------------------


module portaNOT (s, a);
	
	output s;
	input  a;
	
	assign s = ~(a);
	
endmodule // fim portaNOT


module testeportaNOT ;

	reg  a;
	wire s;
	
	portaNOT NOT1(s ,a);
	
	
	//programa
	
	initial begin 
	
		$display("\n Guia 02 - Caio Ragacci Pimentel - 405794 ");
		$display("\n Tabela - Verdade da Porta NOT");
		$display("\n A  = ~S\n");
		
		
	#1	a = 0;	
		$monitor(" %b = %b", a, s);	
	#1	a = 1;
	
		
	end

endmodule // fim testeportaNOT
