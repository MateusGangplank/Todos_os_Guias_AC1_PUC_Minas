// ---------------------
//	Programação em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia 10		Implementação 01
//	Implementar um latch SR com portas NOR
//
// ---------------------

module implementacao01;
	reg set,reset;
	wire q,q1;
	
	nor NOR1 (q,set,q1);
	nor NOR2 (q1,reset,q);
	
initial begin:start
end
	
//---------------------
//---PARTE PRINCIPAL---
//---------------------

initial begin:main
	$display ("Guia 10		Implementação 01");
	$display ("Implementar um latch SR com portas NOR\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matrícula:405844\n");
	$display ("Relatório de Testes");
	#2 set = 0; reset = 0;
	$monitor ("Set [%b] Reset [%b] 	Q[%b] Q'[%b]", set,reset,q,q1 );

	#2 set = 1;
	#2 reset = 1;
	#2 set = 0;
	
end//end parte principal
endmodule

/*
Relatório de Testes
    Set [0] Reset [0] 	Q[x] Q'[x]
    Set [1] Reset [0] 	Q[0] Q'[1]
    Set [1] Reset [1] 	Q[0] Q'[0]
    Set [0] Reset [1] 	Q[1] Q'[0]
*/