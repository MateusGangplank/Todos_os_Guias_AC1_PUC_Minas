//-----------------------------
// Nome: Silvino Henrique Santos de Souza	
// Matrícula: 412773
//-----------------------------



//-----------------------------
//------ GUIA 02 - 01----------
//-----------------------------


module nandgate (s, a, b);
	
	output s;
	input  a, b;
	
	assign s = ~(a & b);
	
endmodule // fim nandgate


module testorgate ;

	reg  a ,b;
	wire s, s1, s2;
	                          // SE POSSIVEL, DEFINIR EM OUTRO MODULO
	nandgate NAND1 (s1 ,a ,a);
	nandgate NAND2 (s2, b ,b);
	nandgate NAND3 (s , s1,s2);
	
	
	initial begin 
	
		$display("\n Guia 02_01 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n Tabela - Verdade da Porta OR, usando NAND");
		$display("\n a | b = s\n");
	
	#1	a = 0; b = 0;
	$monitor(" %b | %b = %b", a, b, s);
	#1	a = 0; b = 1;
	#1	a = 1; b = 0;
	#1	a = 1; b = 1;
		
	end

endmodule // fim testorgate

/*Teste:
Guia 02_01 - Silvino Henrique Santos de Souza - 412773 
    
     Tabela - Verdade da Porta OR, usando NAND
    
     a | b = s
    
     0 | 0 = 0
     0 | 1 = 1
     1 | 0 = 1
     1 | 1 = 1*/
     
