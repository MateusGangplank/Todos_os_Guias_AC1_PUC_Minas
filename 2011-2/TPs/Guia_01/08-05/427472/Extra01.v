//----------------------
//Extra01 - circ
//Nome:Wender Zacarias Xavier
//Matrícula:427472
//----------------------

//----------------------
//--buffer
//----------------------

module buffer (output s, input p);
 assign s = p;//criar vinculo permanente
        		//(dependencia)
endmodule // buffer

//----------------------
//--not gate
//----------------------

module notgate (output s, input p);
 assign s = ~p;//criar vinculo permanente
        		   //(dependencia)
endmodule // notgate

//----------------------
//--or gate
//----------------------

module orgate (output s, input p, input q, input r);
 assign s = p|q|r;	//criar vinculo permanente
        		   	//(dependencia)
endmodule // orgate

//----------------------
//--and gate
//----------------------

module andgate (output s, input p, input q, input r);
 assign s = (p & q & r);	//criar vinculo permanente
        		   	         //(dependencia)
endmodule // andgate

//----------------------
//--xor gate
//----------------------

module xorgate (output [0:3]s, input [0:3]p, input [0:3]q);
 assign s = p^q;	//criar vinculo permanente
        		   	//(dependencia)
endmodule // xorgate

//----------------------
//--nor gate
//----------------------

module norgate (output s, input p, input q);
 assign s = (~(p|q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // norgate

//----------------------
//--xnor gate
//----------------------

module xnorgate (output s, input p, input q);
 assign s = (~(p^q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // xnorgate

//----------------------
//--nand gate
//----------------------

module nandgate (output s, input p, input q);
 assign s = (~(p&q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // nandgate

//----------------------
//--Circuito
//----------------------
module circ;
//----------------------dados locais
  reg a,b,c,d,e,f,g,h;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
    andgate AND1(s1,a,b,c);
	 buffer BF1(s2,d);
	 orgate OR1(s3,s2,e,f);
	 norgate NOR1(s4,g,h);
	 nandgate NAND1(s5,s1,s3);
	 xnorgate XNOR1(s,s5,s4);
  
//---------------------- preparacao
 initial begin:start
  a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
 end
//---------------------- parte principal
 initial begin
   $display("Extra01 - Wender Zacarias Xavier - 427472");
	$display("Test Circuito");
	$display("\na b c d e f g h = s\n");
	$monitor("%b %b %b %b %b %b %b %b = %b",a,b,c,d,e,f,g,h,s);
#1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
		end

endmodule //circ


/** Resultados obtidos
   Test Circuito
    
    a b c d e f g h = s
    
    0 0 0 0 0 0 0 0 = 1
    
    						  
   **/