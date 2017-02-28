// -------------------------
// Extra02
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

module extra02  (output s,
					  input operator,
                 input [5:0]a,
                 input [5:0]b); 
		 wire sxor1;
		 wire sxor2;
		 wire sxor3;
		 wire sxor4;
		 wire sxor5;
		 wire sxor6;
		 wire noperator;
		 wire sor;
		 wire sand1;
		 wire sand2;
		 
	xor XOR1 (sxor1,a[0],b[0]);
	xor XOR2 (sxor2,a[1],b[1]);
	xor XOR3 (sxor3,a[2],b[2]);
	xor XOR4 (sxor4,a[3],b[3]);
	xor XOR5 (sxor5,a[4],b[4]);
	xor XOR6 (sxor6,a[5],b[5]);
	or OR1 (sor,sxor1,sxor2,sxor3,sxor4,sxor5,sxor6);
	not NOT1 (notor,sor);
	and AND1 (sand1,operator,notor);
	not NOT2 (noperator,operator);
	and AND2 (sand2,noperator,sor);
	or OR2 (s,sand1,sand2);
	

endmodule //extra02;

	module test_extra02; 
	
// ------------------------- definir dados 
           reg [5:0] x; 
           reg [5:0] y;
			  reg op; 
	        wire s;
		  
	extra02 ERROR (s,op,x,y);
		
// ------------------------- parte principal
 initial begin
 		x = 6'b000000;		y=6'b111111;  op=1'b0;
		
   $display("Extra02 - Wender Zacarias Xavier - 427472");
	$display("Test Somador Algébrico selecionável (Chave)");
	$display("\n *** Resultado ***  ");
	$display("\n Chave 0 = Diferença \n Chave 1 = Equals \n");
	$monitor("x=%b	  y=%b	\n    Chave = %b	\n	Resultado =%b	\n\n",x,y,op,s);

#1 x=6'b001111;	y = 6'b111011;
#1 op = 1'b1;
#1 x=6'b001111;	y = 6'b001111;
#1 op=1'b0;
#1 x=6'b010011;	y = 6'b110011;

	
		end

endmodule //extra02
