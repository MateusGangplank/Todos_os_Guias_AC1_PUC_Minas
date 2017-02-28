// -------------------------
// Extra01
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
  reg[3:0] x,y,sel;    //definir registrador
  					   //(variavel independente)
  wire[3:0] s1,s2,s3,s4,s5,s6,s7,s8,notsel,s9,sx,sy;  // definir conexao(fio)
   				   //(variavel dependente)
//---------------------- instancia
     
	 xorgate XOR1 (s1,x,y);
	 xorgate XOR2 (s2,x,y);
	 xorgate XOR3 (s3,x,y);
	 xorgate XOR4 (s4,x,y);
	 orgate ORALL (sx,s1,s2);
	 orgate ORALL2 (sy,s3,s4);
	 orgate ORALL3 (s5,sx,sy);
	 notgate NOT1 (s6,s5);
	 andgate AND1 (s7,s6,sel);
	 notgate NOT2 (notsel, sel);
	 andgate AND2 (s8,notsel,s5);
	 orgate OR (s9,s7,s8);

//---------------------- preparacao
 initial begin:start
  x = 4'b0101;    y = 4'b0011;	 sel = 4'b0000;
   end
//---------------------- parte principal
 initial begin
   $display("Extra01 - Wender Zacarias Xavier - 427472");
	$display("Test Circuito");
	$display("\n *** Resultado ***  ");
	$display(" Chave 0 = Diferente \n Chave 1 = Igual ");
	$monitor("\n Chave = %b 	X= 4%b  	Y= %4b   Resultado= %4b",sel[0],x,y,s9);
#1 x=4'b1111; y=4'b1111;
#1 sel = 4'b1111;
#1 x=4'b1101; y=4'b1011;
#1 sel = 4'b0000;
#1 x=4'b1011; y=4'b1001; sel = 4'b1111;


		
		end

endmodule //circ
