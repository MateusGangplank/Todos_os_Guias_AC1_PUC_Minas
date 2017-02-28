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


module testandgate ;

	reg  a ,b;
	wire s ,s1, s2;
	
	norgate NOR1(s1 ,a ,a);
	norgate NOR2(s2, b ,b);
	norgate NOR3(s ,s1,s2);
	
	
	initial begin 
	
		$display("\n Guia 02 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n Tabela - Verdade da Porta AND, usando NOR");
		$display("\n a & b = s\n");
		
		
	#1	a = 0; b = 0;	
		$monitor(" %b & %b = %b", a, b, s);	
	#1	a = 0; b = 1;
	#1	a = 1; b = 0;
	#1	a = 1; b = 1;
			
	end

endmodule // fim testandgate

/*Teste:
Guia 02 - Silvino Henrique Santos de Souza - 412773 
    
     Tabela - Verdade da Porta AND, usando NOR
    
     a & b = s
    
     0 & 0 = 0
     0 & 1 = 0
     1 & 0 = 0
     1 & 1 = 1*/