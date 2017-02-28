// -------------------------
// Exemplo0027
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734
// ------------------------- 

module extra02  (output s, input operator, input [2:0]a, input [2:0]b); 
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

	or OR1 (sor,sxor1,sxor2,sxor3,sxor4);
	not NOT1 (notor,sor);
	and AND1 (sand1,operator,notor);
	not NOT2 (noperator,operator);
	and AND2 (sand2,noperator,sor);
	or OR2 (s,sand1,sand2);
	
endmodule //extra02;

module test_extra02;	
// ------------------------- definir dados 
	reg [2:0] x; 
	reg [2:0] y;
	reg op; 
	wire s;
		  
	extra02 ERROR (s,op,x,y);
		
// ------------------------- parte principal
	initial begin
	 	x = 3'b000;	y = 3'b111;  op = 1'b0;
			
	   $display("Exemplo0027 - João Henrique Mendes de Oliveira - 392734");
		$display("\n Chave 0 = Diferença \n Chave 1 = Equals \n");
		$monitor("x = %b	  y = %b	\n    Chave = %b	\n	Resultado = %b	\n\n", x, y, op, s);
	
		#1 x = 3'b111;	y = 3'b011;
		#1 op = 1'b1;
		#1 x = 3'b111;	y = 3'b111;
		#1 op = 1'b0;
		#1 x = 3'b011;	y = 3'b011;
	end

endmodule //Exemplo0027
