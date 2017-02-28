// -------------------------
// Exemplo0035
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
//--xor gate
//----------------------

module xorgate (output [3:0]s, input [3:0]p, input [3:0]q);
 assign s = p^q;	//criar vinculo permanente
        		   	//(dependencia)
endmodule // xorgate

//----------------------
//--xnor gate
//----------------------

module xnorgate (output [3:0]s, input [3:0]p, input [3:0]q);
 assign s = (~(p^q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // xnorgate

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
  reg[3:0] x,y;    //definir registrador
  					   //(variavel independente)
  wire[3:0] s1,s2,s3,s4,s5,s6,s7,s8;  // definir conexao(fio)
   				   //(variavel dependente)
//---------------------- instancia
     
	 notgate NOT1(s1,x);
	 orgate OR1(s2,x,y);
	 norgate NOR1(s3,x,y);
	 nandgate NAND1(s4,x,y);
	 andgate AND1(s5,x,y);
	 xnorgate XNOR1(s6,x,y);
	 xorgate XOR1(s7,x,y);
	 notgate NOT2(s8,y);

//---------------------- preparacao
 initial begin:start
  x = 4'b0101;    y = 4'b0011; 
   end
//---------------------- parte principal
 initial begin
   $display("Exemplo0034 - Wender Zacarias Xavier - 427472");
	$display("Test Circuito");
	$display("\n *** Resultado ***  ");
	$monitor("\n x = %4b  y = %4b \n NOT x = %4b\n OR = %4b \n NOR = %4b \n NAND = %4b \n AND = %4b \n XNOR = %4b \n XOR = %4b \n NOT y = %4b  ",x,y,s1,s2,s3,s4,s5,s6,s7,s8);
#1 x=4'b1111; y=4'b1111;
#1 x=4'b1101; y=4'b1011;
#1 x=4'b1011; y=4'b1001;

		
		end

endmodule //circ
