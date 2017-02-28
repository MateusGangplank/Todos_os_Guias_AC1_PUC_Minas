// ----------------------------------------
// Exercicio02 - NOR
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
//-----------------------------------------

//-----------------------------------------
//--nor gate
//-----------------------------------------
module norgate(output s, input p, input q);

 assign s = (~(p | q)); 
endmodule // norgate

//-----------------------------------------
//--test nor gate
//-----------------------------------------
module testnorgate;
//-----------------------------dados locais
 reg a, b;	//definir registrador
 wire s;	//definir conex�o (fio)
//--------------------------------instancia
 norgate NOR1(s, a, b);
//-------------------------------preparacao
 initial begin: star
  a = 0; b = 0;
 end
//--------------------------parte principal
 initial begin
	 $display("Exerc�cio 02 - Jo�o Henrique M. de Oliveira - 392734");
	 $display("Test NOR gate");
	 $display("\n ~(a | b) = s\n");
	 a = 0; b = 0;
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 0; b = 1; 
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 1; b = 0; 
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 1; b = 1; 
	#1 $display("%b & %b = %b", a, b, s); 
 end 
	 
 endmodule // testnorgate