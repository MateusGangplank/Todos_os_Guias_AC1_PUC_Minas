// ------------------------
// Guia01 - Capitulo3
// Nome: Karen Alves Pereira
// Matricula: 407451
// ------------------------

// -----------------------
// XNOR
//-- xnor gate
// -----------------------

 module xnorgate (s, x, y, z, w);     //-- definindo a saida e as entradas
 output s;                            //-- saida
 input x, y, z, w;                    //-- entradas

 assign s = ~(x ^ y ^ z ^ w);        //-- operacao

 endmodule // fim xnorgate            //-- fim modulo

// ---------------------
// -- Teste xnor gate
// ---------------------

 module testxnorgate;        //-- teste
 reg x, y, z, w;             //-- valores definidos (registradores)
 wire s;                     //-- valor alternado de acordo com a operacao

 xnorgate XNOR1 (s, x, y, z, w);    //-- nomeando a porta

 initial begin
		$display ("Guia 01 - Karen Alves Pereira - 407451");
		$display ("Teste XNOR gate");
		$display ("\n~(x ^ y ^ z ^ w) = s\n");
		x=0; y=0; z=0; w=0;    //-- fornecendo valores
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);   //-- em um instante, tem os valores fornecidos e gera a saida
		x=0; y=0; z=0; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=0; y=0; z=1; w=0;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=0; y=0; z=1; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=0; y=1; z=0; w=0;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=0; y=1; z=0; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=0; y=1; z=1; w=0;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=0; y=1; z=1; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=0; z=0; w=0;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=0; z=0; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=0; z=1; w=0;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=0; z=1; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=1; z=0; w=0;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=1; z=0; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=1; z=1; w=0;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
		x=1; y=1; z=1; w=1;
 #1   $display ("~(%b ^ %b ^ %b ^ %b) = %b", x, y, z, w, s);
 end     //--fim inicial

 endmodule // -- fim testxnorgate 