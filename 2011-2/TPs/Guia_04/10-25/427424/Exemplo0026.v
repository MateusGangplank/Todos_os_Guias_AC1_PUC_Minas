// -------------------------
// Exemplo0026 – SOMADOR
// Nome: Jonatas Sena Ferreira
// Matricula: 427424

module soma  (output[5:0]s1, output[5:0]s2, output[5:0]s3, output[5:0]s4,  input [5:0]carryIn, input [5:0]a, input [5:0]const, input [5:0]b); 
					  
		wire [5:0]sand1;
		wire [5:0]sand2;
		wire [5:0]sand3;
		wire [5:0]sand4;
		wire [5:0]sand5;
		wire [5:0]sand6;
		wire [5:0]sand7;
		wire [5:0]sand8;
		wire [5:0]sand9;
		wire [5:0]sand10;
		wire [5:0]notcarry;
		wire [5:0]notxor;
		wire [5:0]nota;
		wire [5:0]sxor1;
		wire [5:0]sxor2;

	and AND1 [5:0] (sand1, carryIn, b);
	and AND2 [5:0] (sand2, carryIn, a);
	not NOT1 [5:0] (notcarry, carryIn);
	and AND3 [5:0] (sand3, notcarry, b);
	not NOT2 [5:0] (nota, a);
	and AND4 [5:0] (sand4, notcarry, a);
	and AND5 [5:0] (sand5, carryIn, const);
	and AND6 [5:0] (sand6, sand1, sand2);
	and AND7 [5:0] (sand7, const, notcarry);
	and AND8 [5:0] (sand8, sand4, sand3);
	xor XOR1 [5:0] (sxor1, sand1, sand2);
	xor XOR2 [5:0] (sxor2, sand4, sand3);
	and AND9 [5:0] (sand9, sand1, sxor1);
        xor XOR3 [5:0] (s1, sand5, sxor1);
	or OR1 [5:0] (s2, sand9, sand6);
	not NOT3 [5:0] (notxor, sxor2);
	xor XOR4 [5:0] (s3, sxor2, sand7);
	and AND10 [5:0] (sand10, notxor, sand7);
	or OR2 [5:0] (s4, sand10, sand8);

endmodule //soma;

	module test_soma; 
	
           reg [5:0] w; 
           reg [5:0] z; 
           reg [5:0] carryIn;
	   reg [5:0] constante;
           wire[5:0]s1;
			  wire[5:0]s2;
			  wire[5:0]s3;
			  wire[5:0]s4;
		  
	soma ERROR (s1,s2,s3,s4,carryIn,w,constante,z);
		

 initial 
begin
 		w = 6'b000000;		z=6'b111111;	carryIn = 6'b000000;  constante  = 6'b000000;
		
   $display("Exemplo0026 - Jonatas Sena Ferreira - 427424");
	$display("SOMADOR");
	$display("CarryIn 0 = Diferença \nCarryIn 1 = Soma \n");
	$monitor("w=%b	z=%b	CarryIn=%b	\nSoma=%b	CarryOut=%b	\nDiferença=%b	CarryOut=%b\n\n",w,z,carryIn,s1,s2,s3,s4);

#1 w=6'b001001;	z = 6'b111011;
#1 carryIn = 6'b111111;
#1 w=6'b001111;	z = 6'b001101;
#1 w=6'b010001;	z = 6'b111011;

	
end

endmodule //soma
