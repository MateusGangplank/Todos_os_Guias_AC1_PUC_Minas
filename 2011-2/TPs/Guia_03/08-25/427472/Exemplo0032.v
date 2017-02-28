// -------------------------
// Exemplo0032
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

//----------------------
//--or gate
//----------------------

module orgate (output [3:0]s, input [3:0]p, input [3:0]q);
 assign s = ( p|q );	//criar vinculo permanente
        		   	//(dependencia)
endmodule // orgate

//----------------------
//--and gate
//----------------------

module andgate (output [3:0]s, input [3:0]p, input [3:0]q);
 assign s = (p & q);	//criar vinculo permanente
        		   	         //(dependencia)
endmodule // andgate


//----------------------
//--not gate
//----------------------

module notgate (output [3:0]s, input [3:0]p);
 assign s = ~p;//criar vinculo permanente
        		   //(dependencia)
endmodule // notgate

//----------------------
//--Circuito
//----------------------
module circ;
//----------------------dados locais
  reg[3:0] x,y,sel;    								//definir registrador
  					   								   //(variavel independente)
  wire[3:0]s,sand1,sand2,sand3,sor1,notsel;		   // definir conexao(fio)
   				  									   //(variavel dependente)

//---------------------- instancia
    
	 andgate AND1(sand1,x,y);
	 orgate OR1(sor1,x,y);
	 notgate NOR1(notsel,sel);
	 andgate AND2(sand2,sand1,sel);
	 andgate AND3(sand3,sor1,notsel);
	 orgate OR2(s,sand2,sand3);

//---------------------- preparacao
 initial begin:start
  x = 4'b0101;    y = 4'b0011;  sel = 4'b0000;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0032 - Wender Zacarias Xavier - 427472");
	$display("Test Circuito");
	$display("\n *** Resultado ***  ");
	$display("\n Chave 0 = OR \n Chave 1 = AND");
	$monitor("Chave = %b \n x= %4b  y= %4b  Resultado= %4b",sel,x,y,s);
#1 sel=4'b1111;
#1 x=4'b1001; y=4'b1111;
#1 sel=4'b0000;
		
		end

endmodule //circ
