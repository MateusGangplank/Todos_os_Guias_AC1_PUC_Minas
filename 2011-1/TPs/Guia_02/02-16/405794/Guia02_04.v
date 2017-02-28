//-----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//-----------------------------



//-----------------------------
//------ GUIA 02 - 02----------
//-----------------------------


module portaNAND (s, a, b);
	
	output s;
	input  a, b;
	
	assign s = ~(a & b);
	
endmodule // fim portaNAND


module testeportaNOR ;

	reg  a ,b;
	wire s1 ,s2, s3, s4;
	
	portaNAND NAND1(s1 ,a ,a);
	portaNAND NAND2(s2, b ,b);
	portaNAND NAND3(s3 ,s1,s2);
	portaNAND NAND4(s4 ,s3,s3);
	
	//programa
	
	initial begin 
	
		$display("\n Guia 02 - Caio Ragacci Pimentel - 405794 ");
		$display("\n Tabela - Verdade da Porta NOR");
		$display("\n ~(A | B) = S\n");
		
		
	#1	a = 0; b = 0;	
		$monitor(" ~(%b | %b) = %b", a, b, s4);	
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
			
	end

endmodule // fim testeportaNOR
