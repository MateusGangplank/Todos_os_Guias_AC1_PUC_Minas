// ----------------------------------------
// Exercicio05 - OR
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
//-----------------------------------------

//-----------------------------------------
//--or gate
//-----------------------------------------
module orgate(output s, input p, input q, input r);

 assign s = (p | q) | r; 
endmodule // orgate

//-----------------------------------------
//--test or gate
//-----------------------------------------
module testorgate;
//-----------------------------dados locais
 reg a, b, c;	//definir registrador
 wire s;	//definir conexão (fio)
//--------------------------------instancia
 orgate OR1(s, a, b, c);
//-------------------------------preparacao
 initial begin: star
  a = 0; b = 0; c = 0;
 end
//--------------------------parte principal
 initial begin
	 $display("Exercício 05 - João Henrique M. de Oliveira - 392734");
	 $display("Test OR gate");
	 $display("\n (a & b) & c s\n");
	 a = 0; b = 0; c = 0;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s); 
	 a = 0; b = 0; c = 1;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s);
	 a = 0; b = 1; c = 0;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s);
	 a = 0; b = 1; c = 1;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s);
	 a = 1; b = 0; c = 0;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s);
	 a = 1; b = 0; c = 1;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s);
	 a = 1; b = 1; c = 0;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s);
	 a = 1; b = 1; c = 1;
	#1 $display("(%b & %b)& %b = %b", a, b, c, s);
 end
	 
 endmodule // testorgate