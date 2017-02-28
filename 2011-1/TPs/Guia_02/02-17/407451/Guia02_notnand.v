// Guia 02 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 17/02/2011
//------------------------------------
//-- Tabela verdade da porta NOT
//-- construida atraves de portas NAND
//-------------------------------------

 module notnand(s, x);   //-- definindo a saida e as entradas
 output s;               //-- saida
 input x;                //-- entradas
 
 assign s = ~(x & x);     //-- operacao para obter a tabela verdade da porta NOT atraves da porta NAND
 
 endmodule          //-- fim modulo notnand
 
 //--------------------------------------
 //-- Teste NOTNAND
 //---------------------------------------
 
 module testnotnand;       //-- criando modulo para teste
 reg x;                    //-- valores definidos (registradores)
 wire s;                   //-- valor alternado de acordo com a operacao  
 
 notnand NOTN1(s, x);       //-- nomeando a porta
 
 initial begin
 		$display("Guia 02 - Karen Alves Pereira - 407451");
		$display("Tabela-verdade da porta NOT construida atraves de portas NAND.");
		$display("Teste NOTNAND.");
		$display("\n~(~x) = s\n");      // -- imprimindo na tela
		$monitor("~(%b) = %b", x, s);
	   x=0;               //-- fornecendo valores
 #1	x=1;
 end              //-- fim begin
 
 endmodule       //-- fim modulo testnotnand