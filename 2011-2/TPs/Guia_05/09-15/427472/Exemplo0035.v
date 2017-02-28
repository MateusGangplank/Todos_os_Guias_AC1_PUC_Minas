// -------------------------
// Guia 05 - Exemplo0035.v
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

//--------------------------------------------------------
//-- Half Sum
//---------------------------------------------------------

module halfsum (output s0, output s1, input a, input b);

   xor XOR1(s0,a,b);
   and AND1(s1,a,b);

endmodule // halfsum

//---------------------------------------------------------

//----------------------
//--buffer
//----------------------

module buffer (output s, input p);
 assign s = p;//criar vinculo permanente
        		//(dependencia)
endmodule // buffer
//--------------------------------------------------------



//--------------------------------------------------------
//-- Complete Sum
//---------------------------------------------------------

module completesum (output s0, output s1,input CarryIn, input a, input b);

	wire carryout1;	
	wire shs;
	wire carryout2;	
	
   
   halfsum HF1(shs,carryout1,a,b);
   halfsum HF2(s0,carryout2,CarryIn,shs);
   or OR1 (s1,carryout1,carryout2);

endmodule // completesum

//---------------------------------------------------------

//--------------------------------------------------------
//-- Full Subtractor / Sum
//---------------------------------------------------------

module fullsubs (output s0, output s1,input a, input b, input selec, input cin);

	wire carryout1;	
	wire shs;
	wire carryout2;	
	
   
   xor XOR1(sxor,b,selec);
   completesum CS1(s0,s1,a,sxor,cin);


endmodule // fullsubs

//---------------------------------------------------------


//--------------------------------------------------------
//-- Incremento de 1 operando
//---------------------------------------------------------

module increment (output [5:0] s0, input [5:0] a,input [5:0]increm);

 assign s0 = ( a + increm ); 

endmodule // increment

//---------------------------------------------------------

//--------------------------------------------------------
//-- Decremento de 1 operando
//---------------------------------------------------------

module decrement (output [5:0] s0, input [5:0] a,input [5:0]decrem);

 assign s0 = ( a - decrem[0] ); 

endmodule // decrem

//---------------------------------------------------------

//--------------------------------------------------------
//-- Magnitude
//---------------------------------------------------------
module magnitude ( output s,output t, output u, a,input b);

	wire na;
	wire nb;
	
	buffer BUFFER1 (s,a);
	buffer BUFFER2 (t,b);
	not NOT1 (na,a);
	not NOT2 (nb,b);	
	and AND1 (u,nb,na);
	
endmodule // magnitude
	
//---------------------------------------------------------

//--------------------------------------------------------
//-- Igual
//---------------------------------------------------------
module igual ( output s , output t , output u , output v , 
					output w , output x , input [5:0]a,input [5:0]b);
					
	
	wire sxnor2,sxnor3,sxnor4,sxnor5,sxnor6;
				
	xnor XNOR1 (x,a[0],b[0]);
	xnor XNOR2 (sxnor2,a[1],b[1]);
	xnor XNOR3 (sxnor3,a[2],b[2]);
	xnor XNOR4 (sxnor4,a[3],b[3]);
	xnor XNOR5 (sxnor5,a[4],b[4]);
	xnor XNOR6 (sxnor6,a[5],b[5]);
	
	and AND1 (w,x,sxnor2);
	and AND2 (v,w,sxnor3);
	and AND3 (u,v,sxnor4);
	and AND4 (t,u,sxnor5);
	and AND5 (s,t,sxnor6);

endmodule // igual
	
//---------------------------------------------------------

//--------------------------------------------------------
//-- Maior Menor
//---------------------------------------------------------
module maiormenor ( output s , input c, input d, input e, input f,
						  input g, input [5:0]a , input [5:0]b );
	
	wire sand1,sand2,sand3,sand4,sand5,sand6,sand7,sand8,sand9,san10,sand11;
	wire sor1,sor2,sor3,sor4,nb,nb1,nb2,nb3,nb4,nb5;
	
	not NOTB (nb,b[0]);
	not NOTB2 (nb1,b[1]);
	not NOTB3 (nb2,b[2]);
	not NOTB4 (nb3,b[3]);
	not NOTB5 (nb4,b[4]);
	not NOTB6 (nb5,b[5]);

	and AND1 (sand1,a[0],nb);
	and AND2 (sand2,a[1],nb1);
	and AND3 (sand3,a[2],nb2);
	and AND4 (sand4,a[3],nb3);
	and AND5 (sand5,a[4],nb4);
	and AND6 (sand6,a[5],nb5);
	
	and AND7 (sand7,c,sand2);
	and AND8 (sand8,d,sand3);
	and AND9 (sand9,e,sand4);
	and AND10 (sand10,f,sand5);
	and AND11 (sand11,g,sand6);
	
	or OR1 (sor1,sand1,sand7);
	or OR2 (sor2,sand8,sor1);
	or OR3 (sor3,sand9,sor2);
	or OR4 (sor4,sand10,sor3);
	or OR5 (s,sand11,sor4);
					
	

endmodule // maiormenor
	
//---------------------------------------------------------

//--------------------------------------------------------
//-- Entrada Bits
//---------------------------------------------------------
module entrada ( output said1 , output said2 , output said3 , input [5:0]a, input [5:0]b);
					
	wire sai1,s2,s3,s4,s5,s6;
	wire sai2;
	
	igual IGUAL1 (sai1,s2,s3,s4,s5,s6,a[5:0],b[5:0]);
	maiormenor MM1(sai2,s6,s5,s4,s3,s2,a[5:0],b[5:0]);
	magnitude MAG1(said1,said2,said3,sai2,sai1);

endmodule // entrada
	
//---------------------------------------------------------


module ex0035 (input [5:0]a,
					input [5:0]b,
					output igual,
					output maior,
					output menor);
	
	
	entrada IN1(igual,maior,menor,a,b);
	

endmodule // ex0035 ;

	module test_ex0035; 
	
// ------------------------- definir dados 
           	reg [5:0] a; 
           	reg [5:0] b; 
	
				wire igual;
				wire maior;
				wire menor;
		  
	ex0035 ERROR (a,b,menor,igual,maior);
		
// ------------------------- parte principal
 initial begin
 	a = 6'b000000;		b=6'b111111;	
   $display("Exercício 0035.v - Wender Zacarias Xavier - 427472");
	$display("Test Comparador Magnitude ");
	$display("\n *** Resultado ***  ");
	$display("\n Resultado verdadeiro(1) \n Resultado falso(0)");
	$monitor("A=%b	 B=%b	\n  A > B ->%b		A = B ->%b		A < B ->%b  \n",a,b,menor,igual,maior);
#1 a=6'b011001;	b=6'b011001;
#1 a=6'b000000;	b=6'b000000;
#1 a=6'b100111;	b=6'b100011; 
	
		end

endmodule //Exemplo0035
