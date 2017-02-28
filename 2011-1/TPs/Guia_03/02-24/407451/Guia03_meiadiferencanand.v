// Guia 03 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 24/02/2011
//------------------------------------
// -- Meia-Diferenca
//-------------------------------------
 module halfSubtractornand(s, e1, a, b);    //--criando entradas e saidas
 output s, e1;                              //--definindo saidas
 input a, b;                                //--definindo entradas
 wire tem1, tem2, tem3, tem4,tem5, tem6, tem7, tem8, tem9, x, y;     //-- "declarando variavel para receber valores"
 
 //--OR                               //--portas para construcao da tabela verdade da meia-diferenca
 nand NAND1(tem1, a, a);
 nand NAND2(tem2, b, b);
 nand NAND3(tem3, tem1, tem2);
 //--AND                     
 nand NAND4(tem4, a, b);
 nand NAND5(x, tem4,tem4);
 //--XOR
 nand NAND6(tem5, tem3, tem3);
 nand NAND7(tem6, x, x);
 nand NAND8(tem7, tem5, tem6);
 nand NAND9(tem8, tem7, tem6);
 nand NAND10(s, tem8, tem8);
 //-- E1
 nand NAND12(y,tem1, b);
 nand NAND13(e1, y, y);
 
 endmodule    //-- Fim modulo halfSubtractornand
 //-------------------------------------
 // -- Teste halfAdder
 //-------------------------------------
 
 module testhalfSubtractornand;    //--criando modulo teste
 reg a, b;                         //-- valores definidos (registradores)
 wire s, e1;                       //-- valor alternado de acordo com a operacao
 
 halfSubtractornand HF(s, e1, a, b);      //-- chamando o modulo
 
 initial begin
 		$display("Guia 03 - Karen Alves Pereira - 407451");           //-- imprimindo na tela
		$display("Operador de meia-diferenca apenas com portas NAND");
		$display("\na b s e1");
		$monitor("%b %b %b %b", a, b, s, e1);
		a=0; b=0;             //-- fornecendo valores
 #1   a=0; b=1; 
 #1   a=1; b=0;
 #1   a=1; b=1;
 end                 //-- fim begin
 endmodule  //-- fim modulo testhalfSubtractornand
   
 
 