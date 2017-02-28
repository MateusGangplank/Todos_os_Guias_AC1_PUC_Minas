//-----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//-----------------------------



//-----------------------------
//------ GUIA 02 - 01----------
//-----------------------------


module portaOR (s, a, b);
	
	output s;
	input  a, b;
	
	assign s = ~(a & b);
	
endmodule // fim portaOR


module testeportaOR ;

	reg  a ,b;
	wire s, s1, s2;
	                              // SE POSSIVEL, DEFINIR EM OUTRO MODULO
	portaOR NAND1 (s1 ,a ,a);
	portaOR NAND2 (s2, b ,b);
	portaOR NAND3 (s , s1,s2);
	
	//programa
	
	initial begin 
	
		$display("\n Guia 02 - Caio Ragacci Pimentel - 405794 ");
		$display("\n Tabela - Verdade da Porta OR");
		$display("\n A | B = S\n");
		
	#1	a = 0; b = 0;
		$monitor(" %b | %b = %b", a, b, s);
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
	
		
	end

endmodule // fim testeportaOR

