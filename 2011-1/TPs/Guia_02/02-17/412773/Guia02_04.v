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


module testnorgate ;

	reg  a ,b;
	wire s1 ,s2, s3, s4;
	
	nandgate NAND1(s1 ,a ,a);
	nandgate NAND2(s2, b ,b);
	nandgate NAND3(s3 ,s1,s2);
	nandgate NAND4(s4 ,s3,s3);
	
	
	initial begin 
	
		$display("\n Guia 02 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n Tabela - Verdade da Porta NOR, usando NAND");
		$display("\n ~(a | b) = s\n");
		
		
	#1	a = 0; b = 0;	
		$monitor(" ~(%b | %b) = %b", a, b, s4);	
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
			
	end

endmodule // fim testnorgate

/*Teste:
Guia 02 - Silvino Henrique Santos de Souza - 412773 
    
     Tabela - Verdade da Porta NOR, usando NAND
    
     ~(a | b) = s
    
     ~(0 | 0) = 1
     ~(0 | 1) = 0
     ~(1 | 0) = 0
     ~(1 | 1) = 0*/