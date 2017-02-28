// ----------------------------------------
// Exercicio03 - XNOR
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
//-----------------------------------------

//-----------------------------------------
//--xnor gate
//-----------------------------------------
module xnorgate(output s, input p, input q);

 assign s = (~(p ^ q)); 
endmodule // xnorgate

//-----------------------------------------
//--test xnor gate
//-----------------------------------------
module testxnorgate;
//-----------------------------dados locais
 reg a, b;	//definir registrador
 wire s;	//definir conexão (fio)
//--------------------------------instancia
 xnorgate XNOR1(s, a, b);
//-------------------------------preparacao
 initial begin: star
  a = 0; b = 0;
 end
//--------------------------parte principal
 initial begin
	 $display("Exercício 03 - João Henrique M. de Oliveira - 392734");
	 $display("Test XNOR gate");
	 $display("\n ~(a ^ b) = s\n");
	 a = 0; b = 0;
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 0; b = 1; 
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 1; b = 0; 
	#1 $display("%b & %b = %b", a, b, s); 
	 a = 1; b = 1; 
	#1 $display("%b & %b = %b", a, b, s); 
 end 
	 
 endmodule // testxnorgate