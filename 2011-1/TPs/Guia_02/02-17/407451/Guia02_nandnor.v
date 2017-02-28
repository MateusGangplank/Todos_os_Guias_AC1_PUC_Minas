// Guia02 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 17/02/2011
//-------------------------------------
// -- Tabela verdade da porta NAND 
// -- construida atraves de portas NOR
//-------------------------------------

 module nandnor (s, x, y);    //-- definindo a saida e as entradas
 output s;                    //-- saida
 input x, y;                  //-- entradas
 wire tem1, tem2, tem3;             //-- "declarando variavel para receber valores"
 
 assign tem1 = ~(x | x);           //-- operacao para obter o valor de x negado utilizando porta NOR
 assign tem2 = ~(y | y);           //-- operacao para obter o valor de y negado utilizando porta NOR
 assign tem3 = ~(tem1 | tem2);      // -- operacao para obter o valor de x nor y    
 assign s = ~(tem3 | tem3);           //-- operacao para obter a tabela verdade da porta NAND atraves da porta NOR
  
 endmodule               //-- fim modulo nandnor
 
 //-------------------------------------
// -- Teste nandnor
//-------------------------------------

 module tesnandnor;      //-- criando modulo para teste
 reg x, y;               //-- valores definidos (registradores)
 wire s;                 //-- valor alternado de acordo com a operacao
 
 nandnor NAND1(s, x, y);   //-- nomeando a porta
 
 initial begin
 		$display("Guia 02 - Karen Alves Pereira - 407451");
		$display("Tabela-verdade da porta NAND construida atraves de portas NOR.");
		$display("Teste NANDNOR.");
		$display("\n~(x | y) = s\n");   //--imprimindo na tela
		$monitor("  ~(%b | %b) = %b ", x, y, s);
		x=0; y=0;     //-- fornecendo valores
 #1	x=0; y=1;
 #1	x=1; y=0;
 #1	x=1; y=1;
 end             //-- fim begin
 
 endmodule      //-- fim modulo testnandnor