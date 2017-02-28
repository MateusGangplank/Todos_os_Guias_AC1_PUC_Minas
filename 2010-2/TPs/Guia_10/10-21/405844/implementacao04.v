// ---------------------
//	Programação em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia 10		Implementação 04
//	Implementar um latch SR com portas NAND, PRESET e CLEAR.
//
// ---------------------

module implementacao02;
	reg set,reset,clear,clear1,preset;
	wire w1,w2,		q,q1;
	
	nand NAND1 (w1,set,clear);
	nand NAND2 (w2,reset,clear);
	nand NAND3 (q,preset,w1,q1);
	nand NAND4 (q1,clear1,w2,q);
	
initial begin:start
end
	
//---------------------
//---PARTE PRINCIPAL---
//---------------------

initial begin:main
	$display ("Guia 10		Implementação 04");
	$display ("Implementar um latch SR com portas NAND, PRESET e CLEAR.\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matrícula:405844\n");
	$display ("Relatório de Testes");
	#2 set = 0; reset = 0; clear = 0; clear1 = 0; preset = 0;
	$monitor ("Set [%b] Reset [%b] Clear[%b]		C'[%b] Preset[%b]	 	Q[%b] Q'[%b]", set,reset,clear,clear1,preset,q,q1 );

	#2 set = 0; reset = 0; clear = 0; clear1 = 0; preset = 0;
	#2 set = 0; reset = 0; clear = 0; clear1 = 0; preset = 1;
	#2 set = 0; reset = 0; clear = 0; clear1 = 1; preset = 0;
	#2 set = 0; reset = 0; clear = 0; clear1 = 1; preset = 1;
	#2 set = 0; reset = 0; clear = 1; clear1 = 0; preset = 0;
	#2 set = 0; reset = 0; clear = 1; clear1 = 0; preset = 1;
	#2 set = 0; reset = 0; clear = 1; clear1 = 1; preset = 0;
	#2 set = 0; reset = 0; clear = 1; clear1 = 1; preset = 1;
	#2 set = 0; reset = 1; clear = 0; clear1 = 0; preset = 0;
	#2 set = 0; reset = 1; clear = 0; clear1 = 0; preset = 1;
	#2 set = 0; reset = 1; clear = 0; clear1 = 1; preset = 0;
	#2 set = 0; reset = 1; clear = 0; clear1 = 1; preset = 1;
	#2 set = 0; reset = 1; clear = 1; clear1 = 0; preset = 0;
	#2 set = 0; reset = 1; clear = 1; clear1 = 0; preset = 1;
	#2 set = 0; reset = 1; clear = 1; clear1 = 1; preset = 0;
	#2 set = 0; reset = 1; clear = 1; clear1 = 1; preset = 1;
	#2 set = 0; reset = 0; clear = 0; clear1 = 0; preset = 0;
	#2 set = 0; reset = 0; clear = 0; clear1 = 0; preset = 1;
	#2 set = 0; reset = 0; clear = 0; clear1 = 1; preset = 0;
	#2 set = 0; reset = 0; clear = 0; clear1 = 1; preset = 1;
	#2 set = 0; reset = 0; clear = 1; clear1 = 0; preset = 0;
	#2 set = 0; reset = 0; clear = 1; clear1 = 0; preset = 1;
	#2 set = 0; reset = 0; clear = 1; clear1 = 1; preset = 0;
	#2 set = 0; reset = 0; clear = 1; clear1 = 1; preset = 1;
	#2 set = 0; reset = 1; clear = 0; clear1 = 0; preset = 0;
	#2 set = 0; reset = 1; clear = 0; clear1 = 0; preset = 1;
	#2 set = 0; reset = 1; clear = 0; clear1 = 1; preset = 0;
	#2 set = 0; reset = 1; clear = 0; clear1 = 1; preset = 1;
	#2 set = 0; reset = 1; clear = 1; clear1 = 0; preset = 0;
	#2 set = 0; reset = 1; clear = 1; clear1 = 0; preset = 1;
	#2 set = 0; reset = 1; clear = 1; clear1 = 1; preset = 0;	
	#2 set = 0; reset = 1; clear = 1; clear1 = 1; preset = 1;
	#2 set = 1; reset = 0; clear = 0; clear1 = 0; preset = 0;
	#2 set = 1; reset = 0; clear = 0; clear1 = 0; preset = 1;
	#2 set = 1; reset = 0; clear = 0; clear1 = 1; preset = 0;
	#2 set = 1; reset = 0; clear = 0; clear1 = 1; preset = 1;
	#2 set = 1; reset = 0; clear = 1; clear1 = 0; preset = 0;
	#2 set = 1; reset = 0; clear = 1; clear1 = 0; preset = 1;
	#2 set = 1; reset = 0; clear = 1; clear1 = 1; preset = 0;
	#2 set = 1; reset = 0; clear = 1; clear1 = 1; preset = 1;
	#2 set = 1; reset = 1; clear = 0; clear1 = 0; preset = 0;
	#2 set = 1; reset = 1; clear = 0; clear1 = 0; preset = 1;
	#2 set = 1; reset = 1; clear = 0; clear1 = 1; preset = 0;
	#2 set = 1; reset = 1; clear = 0; clear1 = 1; preset = 1;
	#2 set = 1; reset = 1; clear = 1; clear1 = 0; preset = 0;
	#2 set = 1; reset = 1; clear = 1; clear1 = 0; preset = 1;
	#2 set = 1; reset = 1; clear = 1; clear1 = 1; preset = 0;
	#2 set = 1; reset = 1; clear = 1; clear1 = 1; preset = 1;
	#2 set = 1; reset = 0; clear = 0; clear1 = 0; preset = 0;
	#2 set = 1; reset = 0; clear = 0; clear1 = 0; preset = 1;
	#2 set = 1; reset = 0; clear = 0; clear1 = 1; preset = 0;
	#2 set = 1; reset = 0; clear = 0; clear1 = 1; preset = 1;
	#2 set = 1; reset = 0; clear = 1; clear1 = 0; preset = 0;
	#2 set = 1; reset = 0; clear = 1; clear1 = 0; preset = 1;
	#2 set = 1; reset = 0; clear = 1; clear1 = 1; preset = 0;
	#2 set = 1; reset = 0; clear = 1; clear1 = 1; preset = 1;
	#2 set = 1; reset = 1; clear = 0; clear1 = 0; preset = 0;
	#2 set = 1; reset = 1; clear = 0; clear1 = 0; preset = 1;
	#2 set = 1; reset = 1; clear = 0; clear1 = 1; preset = 0;
	#2 set = 1; reset = 1; clear = 0; clear1 = 1; preset = 1;
	#2 set = 1; reset = 1; clear = 1; clear1 = 0; preset = 0;
	#2 set = 1; reset = 1; clear = 1; clear1 = 0; preset = 1;
	#2 set = 1; reset = 1; clear = 1; clear1 = 1; preset = 0;	
	#2 set = 1; reset = 1; clear = 1; clear1 = 1; preset = 1;

	
end//end parte principal
endmodule

/*
Relatório de Testes

    Set [0] Reset [0] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [0] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [0] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [0] Reset [0] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [0] Reset [0] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [0] Clear[1]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [0] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [0] Reset [0] Clear[1]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [0] Reset [1] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [1] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [1] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [0] Reset [1] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [0] Reset [1] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [1] Clear[1]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [1] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [1] Clear[1]		C'[1] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [0] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [0] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [0] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [0] Reset [0] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [0] Reset [0] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [0] Clear[1]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [0] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [0] Reset [0] Clear[1]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [0] Reset [1] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [1] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [1] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [0] Reset [1] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [0] Reset [1] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [1] Clear[1]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [0] Reset [1] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[1]
    Set [0] Reset [1] Clear[1]		C'[1] Preset[1]	 	Q[0] Q'[1]
    Set [1] Reset [0] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [0] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [1] Reset [0] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [1] Reset [0] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [1] Reset [0] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [0] Clear[1]		C'[0] Preset[1]	 	Q[1] Q'[1]
    Set [1] Reset [0] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [1] Reset [0] Clear[1]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [1] Reset [1] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [1] Reset [1] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [1] Reset [1] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [1] Reset [1] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[1]		C'[0] Preset[1]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[1]		C'[1] Preset[1]	 	Q[1] Q'[1]
    Set [1] Reset [0] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [0] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [1] Reset [0] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [1] Reset [0] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [1] Reset [0] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [0] Clear[1]		C'[0] Preset[1]	 	Q[1] Q'[1]
    Set [1] Reset [0] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [1] Reset [0] Clear[1]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [1] Reset [1] Clear[0]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[0]		C'[0] Preset[1]	 	Q[0] Q'[1]
    Set [1] Reset [1] Clear[0]		C'[1] Preset[0]	 	Q[1] Q'[0]
    Set [1] Reset [1] Clear[0]		C'[1] Preset[1]	 	Q[1] Q'[0]
    Set [1] Reset [1] Clear[1]		C'[0] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[1]		C'[0] Preset[1]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[1]		C'[1] Preset[0]	 	Q[1] Q'[1]
    Set [1] Reset [1] Clear[1]		C'[1] Preset[1]	 	Q[1] Q'[1]
*/