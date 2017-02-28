// --------------------------
// Guia01 - Capitulo3
// Nome: Karen Alves Pereira
// Matricula: 407451
// ---------------------------
// ---------------------------
// ---------------------------
// NAND
// -- nand gate
// ---------------------------

 module nandgate (s, a, b, c);   //-- definindo a saida e as entradas 
 output s;                       //-- saida
 input a, b, c;                  //-- entradas
 
 assign s = ~(a & b & c);        //-- operacao 
 
 endmodule // fim nandgate       //-- fim modulo
 
// ---------------------------
// --  Teste nand gate
// ---------------------------
 
 module testnandgate;        //-- teste 
 reg a, b, c;                //-- valores definidos (registradores)
 wire s;                     //-- valor alternado de acordo com a operacao
 
 nandgate NAND1 (s, a, b, c);  //-- nomeando a porta 
 
 initial begin
 		$display ("Guia 01 - Karen Alves Pereira - 407451");
		$display ("Teste NAND gate");
		$display ("\n~(a & b & c) = s\n");
		a=0; b=0; c=0;    //-- fornecendo valores                 
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);  //-- em um instante, tem os valores fornecidos e gera a saida 
  		a=0; b=0; c=1;                                 //--imprimido na tela  
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);	
    	a=0; b=1; c=0;
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);		
   	a=0; b=1; c=1;
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);
   	a=1; b=0; c=0;
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);
      a=1; b=0; c=1;
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);
 		a=1; b=1; c=0;
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);
      a=1; b=1; c=1;
 #1 	$display("~(%b & %b & %b) = %b", a, b, c, s);	
 end    //--fim inicial
 
 endmodule // -- fim testnandgate