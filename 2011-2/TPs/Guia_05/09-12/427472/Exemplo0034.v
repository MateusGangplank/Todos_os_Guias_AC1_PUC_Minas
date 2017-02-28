// -------------------------
// Guia 05 - Exemplo0034.v
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

module ex0033 (output s0,
					output s1,
					output s2,
					output s3,
					output s4,
					output s5,
					output s6,
	       		input [5:0]decremento,
	       		input [5:0] a,
		       	input [5:0] b,
		      	input selec);
	
	wire circ1;
	wire circ2;
	wire circ3;
	wire circ4;
	wire circ5;
	wire [5:0]sa;
	wire [5:0]sb;
	wire [5:0]notdecremento;	

	decrement IN1  (sa,a,decremento);
	not NOT1 [5:0] (notdecremento,decremento);
	decrement IN2  (sb,b,notdecremento);
	fullsubs FULL1 (s0,circ1,sa[0],sb[0],selec,selec);
	fullsubs FULL2 (s1,circ2,sa[1],sb[1],circ1,selec);
	fullsubs FULL3 (s2,circ3,sa[2],sb[2],circ2,selec);
	fullsubs FULL4 (s3,circ4,sa[3],sb[3],circ3,selec);
	fullsubs FULL5 (s4,circ5,sa[4],sb[4],circ4,selec);
	fullsubs FULL6 (s5,s6,sa[5],sb[5],circ5,selec);
	

endmodule // ex0033 ;

	module test_ex0033; 
	
// ------------------------- definir dados 
           	reg [5:0] x; 
           	reg [5:0] y; 
				reg [5:0] decremento;
				reg sel;	
	
	wire s0;
	wire s1;
	wire s2;
	wire s3;
	wire s4;
	wire s5;
	wire s6;
		  
	ex0033 ERROR (s0,s1,s2,s3,s4,s5,s6,decremento,x,y,sel);
		
// ------------------------- parte principal
 initial begin
 	x = 6'b000000;		y=6'b111111;	sel = 1;	 decremento = 6'b000001;	
   $display("Exercício 0033.v - Wender Zacarias Xavier - 427472");
	$display("Test Somador Algébrico ");
	$display("\n *** Resultado ***  ");
	$display("\n Decremento = 1 (Decremento de 1 no Operando no A) \n Decremento = 0 (Decremento de 1 no operando no B) \n");
	$display("\n Selecionador 0 = Soma \n Selecionador 1 = Diferença \n");
	$monitor("x=%b	 y=%b	Sel= %b  Decremento = %b \n  Resultado = %b%b%b%b%b%b%b  \n\n",x,y,sel,decremento[0],s6,s5,s4,s3,s2,s1,s0);

#1 x=6'b001111;	y = 6'b111011;
#1 sel= 6'b111111;
#1 x=6'b001111;	y = 6'b001111;
#1 decremento = 6'b000000;
#1 x=6'b000000; y = 6'b000000;
#1 x=6'b010011;	y = 6'b110011;

	
		end

endmodule //Exemplo0033
