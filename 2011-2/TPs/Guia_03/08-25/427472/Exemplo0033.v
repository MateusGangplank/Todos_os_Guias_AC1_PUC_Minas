// -------------------------
// Exemplo0033
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

//----------------------
//--nand gate
//----------------------

module nandgate (output [3:0]s, input [3:0]p, input [3:0]q);
 assign s = (~(p&q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // nandgate

//----------------------
//--nor gate
//----------------------

module norgate (output [3:0]s, input [3:0]p, input [3:0]q);
 assign s = (~(p|q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // norgate


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
  reg[3:0] x,y,sel;    //definir registrador
  					   //(variavel independente)
  wire[3:0] s1,s2,s3,s4,sand,sor,snand,snor,notsel;  // definir conexao(fio)
   				   //(variavel dependente)
//---------------------- instancia
    
	 andgate AND1(sand,x,y);
	 orgate OR1(sor,x,y);
	 nandgate NAND1(snand,x,y);
	 norgate NOR1(snor,x,y);
	 notgate NOR2(notsel,sel);
	 andgate AND2(s1,sand,sel);
	 andgate AND3(s2,sor,sel);
	 andgate AND4(s3,snand,notsel);
	 andgate AND5(s4,notsel,snor);

//---------------------- preparacao
 initial begin:start
  x = 4'b0101;    y = 4'b0011;  sel = 4'b0000;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0032 - Wender Zacarias Xavier - 427472");
	$display("Test Circuito");
	$display("\n *** Resultado ***  ");
	$display("\n Chave 0 = NAND e NOR \n Chave 1 = AND e OR "); 
	$monitor("Chave = %b \n NAND gate = %4b | %4b =  %4b \n NOR gate = %4b & %4b = %4b \n AND gate = %4b & %4b = %4b \n OR gate = %4b & %4b = %4b",sel,x,y,s4,x,y,s3,x,y,s1,x,y,s2);
#1 sel=4'b1111;
#1 x=4'b1001; y=4'b1111;
#1 sel=4'b0000;
		
		end

endmodule //circ
