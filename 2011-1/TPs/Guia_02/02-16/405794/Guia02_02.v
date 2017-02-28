//-----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//-----------------------------



//-----------------------------
//------ GUIA 02 - 02----------
//-----------------------------


module portaAND (s, a, b);
	
	output s;
	input  a, b;
	
	assign s = ~(a | b);
	
endmodule // fim portaAND


module testeportaAND ;

	reg  a ,b;
	wire s ,s1, s2;
	
	portaAND NOR1(s1 ,a ,a);
	portaAND NOR2(s2, b ,b);
	portaAND NOR3(s ,s1,s2);
	
	//programa
	
	initial begin 
	
		$display("\n Guia 02 - Caio Ragacci Pimentel - 405794 ");
		$display("\n Tabela - Verdade da Porta AND");
		$display("\n A & B = S\n");
		
		
	#1	a = 0; b = 0;	
		$monitor(" %b & %b = %b", a, b, s);	
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
			
	end

endmodule // fim testeportaAND
