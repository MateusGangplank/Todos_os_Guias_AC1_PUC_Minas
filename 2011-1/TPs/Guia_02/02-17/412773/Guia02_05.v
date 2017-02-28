//-----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773
//-----------------------------

//-----------------------------
//------ GUIA 02 - 02----------
//-----------------------------


module norgate (s, a, b);
	
	output s;
	input  a, b;
	
	assign s = ~(a | b);
	
endmodule // fim norgate


module testnandgate ;

	reg  a ,b;
	wire s1 ,s2, s3, s4;
	
	norgate NOR1(s1 ,a ,a);
	norgate NOR2(s2, b ,b);
	norgate NOR3(s3 ,s1,s2);
	norgate NOR4(s4 ,s3,s3);
	
	
	initial begin 
	
		$display("\n Guia 02 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n Tabela - Verdade da Porta NAND, usando NOR");
		$display("\n ~(a & b) = s\n");
		
		
	#1	a = 0; b = 0;	
		$monitor(" ~(%b & %b) = %b", a, b, s4);	
	#1	a = 0; b = 1;
	#1	a = 1; b = 0;
	#1	a = 1; b = 1;
			
	end

endmodule // fim testnandgate

/*Teste:
Guia 02 - Silvino Henrique Santos de Souza - 412773 
    
     Tabela - Verdade da Porta NAND, usando NOR
    
     ~(a & b) = s
    
     ~(0 & 0) = 1
     ~(0 & 1) = 1
     ~(1 & 0) = 1
     ~(1 & 1) = 0*/