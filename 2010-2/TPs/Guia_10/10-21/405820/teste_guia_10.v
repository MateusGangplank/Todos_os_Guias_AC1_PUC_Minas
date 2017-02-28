// -----------------------------
// Guia 10 - Latches
// Nome: Mariana Ramos de Brito 
// Matricula: 405820
// -----------------------------


//-------------------------exercicio 01
module exercicio_01 (qL, q, s, r);
	
	// latch sr com portas nor

	output q, qL;
	input s, r;

	nor NOR1(qL, s, q);
	nor NOR2(q, r, qL);

endmodule //exercicio_01


//-------------------------exercicio 02
module exercicio_02 (qL, q, s, r);
	
	// latch sr com portas nand

	output q, qL;
	input s, r;

	nand NAND1(q, s, qL);
	nand NAND2(qL, r, q);

endmodule //exercicio_02


//-------------------------exercicio 03
module exercicio_03 (qL, q, d, pr, cl);
	
	// latch d com portas nand, preset e clear

	output q, qL;
	input d, pr, cl;

	wire dL;

	not NOT1(dL, d);

	nand NAND1(q, d, qL, pr);
	nand NAND2(qL, dL, q, cl);

endmodule //exercicio_03


//-------------------------exercicio 04
module exercicio_04 (qL, q, s, r, pr, cl);
	
	// latch sr com portas nand, preset e clear

	output q, qL;
	input s, r, pr, cl;

	nand NAND1(q, s, qL, pr);
	nand NAND2(qL, r, q, cl);

endmodule //exercicio_04


//-------------------------exercicio 05
module exercicio_05 (qL, q, d);
	
	// latch d a partir de sr, sem preset e clear
	
	output q, qL;
	input d;

	wire dL;

	// negar o d
	not NOT1(dL, d);

	// metodo com latch do tipo sr
	exercicio_01 SR(qL, q, d, dL);

endmodule //exercicio_05



//--------------------------------------------------main
module teste_guia_10; 

	reg s, r, d, pr, cl;
	wire q1, qL1, q2, qL2, q3, qL3, q4, qL4, q5, qL5;
	
	
		// instancia	
	exercicio_01 PRIM (qL1, q1, s, r);
	exercicio_02 SEG (qL2, q2, s, r);
	exercicio_03 TER (qL3, q3, d, pr, cl);
	exercicio_04 QUA (qL4, q4, s, r, pr, cl);
	exercicio_05 QUI (qL5, q5, d);

	initial begin:start
		s=1; r=0; d=0; pr=0; cl=0;
	end
	

		// parte principal
	initial begin:main
	
		$display("Guia 10 - Mariana Ramos de Brito - 405820\n");
		$monitor("\nnumero 01: latch SR com nor\nSet = %b\tReset = %b\tq = %b\tqL = %b\n\n\nnumero 02: latch SR com nand\nSet = %b\tReset = %b\tq = %b\tqL = %b\n\n\nnumero 03: latch D com nand, preset e clear\nD = %b\tPreset = %b\tClear = %b\tq = %b\tqL = %b\n\n\nnumero 04: latch SR com nand, preset e clear\nSet = %b\tReset = %b\tPreset = %b\tClear = %b\tq = %b\tqL = %b\n\n\nnumero 05: latch D a partir de um SR\nD = %b\tq = %b\tqL = %b\n\n\n\n", s, r, q1, qL1, s, r, q2, qL2 ,d, pr, cl, q3, qL3, s, r, pr, cl, q4, qL4, d, q5, qL5);


		#1 s=0; r=1; d=1; pr=0; cl=0;
		#1 s=0; r=0; d=0; pr=0; cl=1;
		#1 s=0; r=0; d=1; pr=1; cl=0;
		#1 s=1; r=1; d=0; pr=1; cl=1;
		
	end

endmodule //teste_guia_10
