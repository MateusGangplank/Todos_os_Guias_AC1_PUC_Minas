// -------------------------
// Guia 05 - Exemplo0031.v
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

	wire sxor;
	
   
   xor XOR1(sxor,b,selec);
   completesum SC1(s0,s1,a,sxor,cin);


endmodule // fullsubs

//---------------------------------------------------------

module ex0031 (output s0,
					  output s1,
					  output s2,
					  output s3,
					  output s4, 
					  output s5,
					  output s6,
					  input [5:0] a,
					  input [5:0] b,
					  input selec);

	wire circ1;
	wire circ2;
	wire circ3;
	wire circ4;
	wire circ5;	


	fullsubs FULL1 (s0,circ1,a[0],b[0],selec,selec);
	fullsubs FULL2 (s1,circ2,a[1],b[1],circ1,selec);
	fullsubs FULL3 (s2,circ3,a[2],b[2],circ2,selec);
	fullsubs FULL4 (s3,circ4,a[3],b[3],circ3,selec);
	fullsubs FULL5 (s4,circ5,a[4],b[4],circ4,selec);
	fullsubs FULL6 (s5,s6,a[5],b[5],circ5,selec);
	

endmodule // ex0031 ;

	module test_ex0031; 
	
// ------------------------- definir dados 
           	reg [5:0] x; 
           	reg [5:0] y; 
		reg sel;

           	wire s0;
		wire s1;
		wire s2;
		wire s3;
		wire s4;
		wire s5;
		wire carryout;
		  
	ex0031 ERROR (s0,s1,s2,s3,s4,s5,s6,x,y,sel);
		
// ------------------------- parte principal
 initial begin
 	x = 6'b000000;		y=6'b111111;	sel = 1;		
   $display("Exercício 0031.v - Wender Zacarias Xavier - 427472");
	$display("Test Somador Algébrico selecionável (CarryIn)");
	$display("\n *** Resultado ***  ");
	$display("\n carryIn 0 = Soma \n carryIn 1 = Diferença \n");
	$monitor("x=%b	 y=%b	CarryIn = %b   \n  Resultado = %b%b%b%b%b%b%b  \n\n",x,y,sel,s6,s5,s4,s3,s2,s1,s0);

#1 x=6'b001111;	y = 6'b111011;
#1 sel= 6'b111111;
#1 x=6'b001111;	y = 6'b001111;
#1 x=6'b010011;	y = 6'b110011;

	
		end

endmodule //Exemplo0031
