// ---------------------
//	Programação em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia05	Programa 3
//	Criar um circuito lógico para realizar uma multiplicação de
// dois valores binários com dois bits cada
//
// ---------------------

module testeprograma1;
	reg a1,a2,b1,b2;
	wire s1,s2,s3,s4,s6,s7,s8,s9,s10,s11;

	and AND1 (s1,a1,b1);//resto1
	and AND2 (s2,a1,b2);
	and AND3 (s3,a2,b2);
	and AND4 (s4,a2,b2);
	//half adder
	xor XOR1 (s5,s2,s3);//resto2
	and AND1 (s6,s2,s3);//vai um
	//full adder
	xor XOR2 (s7,0,s4);
	and AND2 (s8,0,s4);
	xor XOR3 (s9,s7,s6);//resto2
	and AND3 (s10,s7,s6);
	or OR1 (s11,s8,s10);//vai um




initial begin:start
end

//PARTE PRINCIPAL

initial begin:main
	$display ("Guia05 - Programa 3");
	$display ("Criar um circuito lógico para realizar uma multiplicação de\ndois valores binários com dois bits cada\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matrícula:405844\n");
	$display ("Relatório de Testes");
	#1	 a1 = 0; a2 = 0; b1 = 0; b2 = 0;
	#1 $monitor ("%b %b * %b %b  = %b %b %b", a2,a1,b2,b1,s11,s9,s5,s1 );
	#1         a1 = 1; a2 = 0; b1 = 1; b2 = 0;
	#1         a1 = 1; a2 = 1; b1 = 1; b2 = 0;
	#1         a1 = 1; a2 = 1; b1 = 1; b2 = 1;
	#1         a1 = 0; a2 = 1; b1 = 1; b2 = 0;
	#1         a1 = 1; a2 = 1; b1 = 0; b2 = 1;
	
end //end module
endmodule
