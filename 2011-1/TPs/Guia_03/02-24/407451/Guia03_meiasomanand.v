// Guia 03 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 24/02/2011
//------------------------------------
// -- Meia-Soma
//------------------------------------- 
 
 module halfAddernand(s, v1, a, b);       //--criando entradas e saidas
 output s, v1;                            //--definindo saidas
 input a, b;                              //--definindo entradas
 wire tem1, tem2, tem3, tem4,tem6, tem7, tem8, tem9;     //-- "declarando variavel para receber valores"
 
 //--OR                               //--portas para construcao da tabela verdade da meia-soma
 nand NAND1(tem1, a, a);
 nand NAND2(tem2, b, b);
 nand NAND3(tem3, tem1, tem2);
 //--AND / V1
 nand NAND4(tem4, a, b);
 nand NAND5(v1, tem4,tem4);
 //--XOR
 nand NAND6(tem6, tem3, tem3);
 nand NAND7(tem7, v1, v1);
 nand NAND8(tem8, tem6, tem7);
 nand NAND9(tem9, tem8, tem7);
 nand NAND10(s, tem9, tem9);
 
 endmodule   //--Fim modulo halfAddernand
 
 //-------------------------------------
 // -- Teste halfAdder
 //-------------------------------------
 
 module testhalfAddernand;           //--criando modulo teste
 reg a, b;                           //-- valores definidos (registradores)
 wire s1, s2;                         //-- valor alternado de acordo com a operacao
 
 halfAddernand HALF1 (s, v1, a, b);        //-- chamando o modulo
 
  initial begin
 		$display("Guia 03 - Karen Alves Pereira - 407451");             //-- imprimindo na tela
		$display("Operador de meia-soma apenas com portas NAND");
		$display("\na b s v1");
		$monitor("%b %b %b %b", a, b, s, v1);
		a=0; b=0;         //-- fornecendo valores
 #1   a=0; b=1;
 #1   a=1; b=0;
 #1   a=1; b=1;
 end                    //-- fim begin
 endmodule    //-- fim modulo  testhalfAddernand
 
 
 