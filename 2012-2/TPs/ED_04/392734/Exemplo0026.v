// ------------------------- 
// Exemplo0026 
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ------------------------- 

module extra01  (output[2:0]s1, output[2:0]s2, output[2:0]s3, output[2:0]s4, input [2:0]carryIn, input [2:0]a,
					  input [2:0]const, input [2:0]b); 
					  
		wire [2:0]sand1;
		wire [2:0]sand2;
		wire [2:0]sand3;
		wire [2:0]sand4;
		wire [2:0]sand5;
		wire [2:0]sand6;
		wire [2:0]sand7;
		wire [2:0]sand8;
		wire [2:0]sand9;
		wire [2:0]sand10;
		wire [2:0]notcarry;
		wire [2:0]notxor;
		wire [2:0]nota;
		wire [2:0]sxor1;
		wire [2:0]sxor2;

	and AND1 [2:0] (sand1,carryIn,b);
	and AND2 [2:0] (sand2,carryIn,a);
	not NOT1 [2:0] (notcarry,carryIn);
	and AND3 [2:0] (sand3,notcarry,b);
	not NOT2 [2:0] (nota,a);
	and AND4 [2:0] (sand4,notcarry,a);
	and AND5 [2:0] (sand5,carryIn,const);
	and AND6 [2:0] (sand6,sand1,sand2);
	and AND7 [2:0] (sand7,const,notcarry);
	and AND8 [2:0] (sand8,sand4,sand3);
	xor XOR1 [2:0] (sxor1,sand1,sand2);
	xor XOR2 [2:0] (sxor2,sand4,sand3);
	and AND9 [2:0] (sand9,sand1,sxor1);
   xor XOR3 [2:0] (s1,sand5,sxor1);
	or OR1 [2:0] (s2,sand9,sand6);
	not NOT3 [2:0] (notxor,sxor2);
	xor XOR4 [2:0] (s3,sxor2,sand7);
	and AND10 [2:0] (sand10,notxor,sand7);
	or OR2 [2:0] (s4,sand10,sand8);

endmodule //extra01;

	module test_extra01; 
	
// ------------------------- definir dados 
           reg [2:0] x; 
           reg [2:0] y; 
			  reg [2:0] carryIn;
			  reg [2:0] constante;
           wire[2:0]s1;
			  wire[2:0]s2;
			  wire[2:0]s3;
			  wire[2:0]s4;
		  
	extra01 ERROR (s1,s2,s3,s4,carryIn,x,constante,y);
		
// ------------------------- parte principal
	initial begin
	 	x = 3'b000;	y = 3'b111;	carryIn = 3'b000;  constante  = 3'b000;
			
	   $display("Exemplo0026 - João henrique Mendes de Oliveira - 392734");
		$display("\n carryIn 0 = Diferença \n carryIn 1 = Soma \n");
		$monitor("\tx = %b	y = %b	carryIn = %b	\n        Soma = %b	CarryOut = %b	\n	Diferença = %b	CarryOut = %b\n\n",x,y,carryIn,s1,s2,s3,s4);
	
		#1 x=3'b111;	y = 3'b011;
		#1 carryIn = 3'b111;
		#1 x=3'b111;	y = 3'b111;
		#1 x=3'b011;	y = 3'b011;
			
	end
endmodule //Exemplo0026
