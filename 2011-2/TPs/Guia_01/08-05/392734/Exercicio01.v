// ----------------------------------------
// Exercicio01 - NAND
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
//-----------------------------------------

//-----------------------------------------
//--nand gate
//-----------------------------------------
module nandgate(output s, input p, input q);

 assign s = (~(p & q)); 
endmodule // nandgate

//-----------------------------------------
//--test nand gate
//-----------------------------------------
module testnandgate;
//-----------------------------dados locais
 reg a, b;	//definir registrador
 wire s;	//definir conex�o (fio)
//--------------------------------instancia
 nandgate NAND1(s, a, b);
//-------------------------------preparacao
 initial begin: star
  a = 0; b = 0;
 end
//--------------------------parte principal
 initial begin
	 $display("Exerc�cio 01 - Jo�o Henrique M. de Oliveira - 392734");
	 $display("Test NAND gate");
	 $display("\n ~(a & b) = s\n");
	 a = 0; b = 0;
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 0; b = 1; 
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 1; b = 0; 
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 1; b = 1; 
	#1 $display("%b & %b = %b", a, b, s); 
 end 
	 
 endmodule // testandgate