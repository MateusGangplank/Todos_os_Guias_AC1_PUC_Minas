//Guia 10
//Nome: Bruno Calil Nicoliello Moreira
//Matricula: 405790	
//21/10/2010

//----------------
// A tabela foi feita de modo diferente dos outros exercicios para melhor organizacao dos dados
//----------------

//-----------------
//Module latchD
//-----------------

module latchD ( q, q_bar, d, en, pr, cl );
	
output q, q_bar;
input  d, en, pr, cl;
	
wire aux1, aux2;
	
nand NAND1 ( aux1, d, en );
nand NAND2 ( aux2, ~d, en );
nand NAND3 ( q, aux1, pr, q_bar ); 
nand NAND4 ( q_bar, aux2, cl, q );
	
endmodule

//-----------------------
//-- TESTE LatchD
//-----------------------
module testeLatch;
	
wire      q, q_bar;
reg       d, en, pr, cl;
	
latchD      L1 ( q, q_bar, d, en, pr, cl );
	
initial begin
		
	$display ("Bruno Calil Nicoliello Moreira - 405790");
	$display("Guia 10 - Ex 05");
	$display ("\nLatch D\n");
	$display ("d   en   pr  cl =  q   q_bar" );
	$monitor("%b   %b    %b   %b  =  %b   %b",d, en, pr, cl, q, q_bar);
	#1	 d = 0; en = 0; pr = 0; cl = 0;
	#1  d = 0; en = 0; pr = 0; cl = 1;
	#1  d = 0; en = 0; pr = 1; cl = 0;
	#1  d = 0; en = 0; pr = 1; cl = 1; 
	#1	 d = 0; en = 1; pr = 0; cl = 1;
	#1	 d = 0; en = 1; pr = 1; cl = 0;
	#1	 d = 1; en = 1; pr = 1; cl = 1;
	#1	 d = 0; en = 1; pr = 1; cl = 1;
	#1  d = 0; en = 1; pr = 1; cl = 1;
	#1	 d = 1; en = 1; pr = 1; cl = 1;
		
	end	

endmodule