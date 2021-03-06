// ---------------------
//	Programa��o em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia05	Programa2
//	Criar um circuito l�gico para realizar uma soma completa de
// dois valores bin�rios com tr�s bits cada
//
// ---------------------

module testeprograma1;
	reg a1,a2,a3,b1,b2,b3;
	wire s1,s2,s3,s4,s6,s7,s8,s9,s10,s11;

	//half subtractor
	xor XOR1 (s1,a1,b2);//resto1
	and AND1 (s2,~a1,b2);//vem um
	//full subtractor
	xor XOR2 (s3,a2,b2);
	and AND2 (s4,~a2,b2);
	xor XOR3 (s5,s3,s2);//resto2
	and AND3 (s6,~s3,s2);
	or OR1 (s7,s4,s6);//vai um
	//full subtractor
	xor XOR2 (s7,a3,b3);
	and AND2 (s8,~a3,b3);
	xor XOR3 (s9,s7,s7);//resto2
	and AND3 (s10,~s7,s7); 	or OR1 (s11,s8,s10);//vai um

initial begin:start
end

//PARTE PRINCIPAL

initial begin:main
	$display ("Guia05 - Programa2");
	$display ("Criar um circuito l�gico para realizar uma diferen�a completa de\ndois valores bin�rios com tr�s bits cada\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matr�cula:405844\n");
	$display ("Relat�rio de Testes");
	 	 a1 = 0; a2 = 0; a3 = 0; b1 = 0; b2 = 0; b3 = 0;
	#1 $monitor ("%b %b %b - %b %b %b  = %b %b %b %b", a3,a2,a1,b3,b2,b1,s11,s9,s5,s1 );
	#1	 a1 = 1; a2 = 0; a3 = 0; b1 = 1; b2 = 0; b3 = 0;
	#1	 a1 = 0; a2 = 1; a3 = 0; b1 = 0; b2 = 1; b3 = 0;
	#1	 a1 = 0; a2 = 0; a3 = 1; b1 = 0; b2 = 0; b3 = 1;
	#1	 a1 = 0; a2 = 1; a3 = 1; b1 = 1; b2 = 0; b3 = 1;
	#1	 a1 = 1; a2 = 1; a3 = 1; b1 = 1; b2 = 1; b3 = 1;
	#1	 a1 = 0; a2 = 1; a3 = 1; b1 = 1; b2 = 0; b3 = 1;
	#1	 a1 = 0; a2 = 1; a3 = 1; b1 = 0; b2 = 1; b3 = 1;
	#1	 a1 = 0; a2 = 0; a3 = 1; b1 = 0; b2 = 1; b3 = 1;
		
end//end module
endmodule

/*

Relat�rio de Testes
0 0 0 + 0 0 0  = 0 0 0 0
0 0 1 + 0 0 1  = 0 0 0 1
0 1 0 + 0 1 0  = x x 1 1
1 0 0 + 1 0 0  = 0 0 0 0
1 1 0 + 1 0 1  = 0 0 1 0
1 1 1 + 1 1 1  = 0 0 0 0
1 1 0 + 1 0 1  = 0 0 1 0
1 1 0 + 1 1 0  = x x 1 1
1 0 0 + 1 1 0  = x x 0 1


*/
