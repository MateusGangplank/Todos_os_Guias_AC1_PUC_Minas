//-----------------------------------------------------
//Exemplo0036 - igualdade ou diferença para 4 bits
// Nome: Julio Machado
// Matrícula: 435666
//------------------------------------------------------

module funcao(output s,input [3:0]a, input[3:0]b);
	wire [3:0]aux;
	xnor xnor1(aux[0],a[0],b[0]);
	xnor xnor2(aux[1],a[1],b[1]);
	xnor xnor3(aux[2],a[2],b[2]);
	xnor xnor4(aux[3],a[3],b[3]);
	nand nand1(s,aux[0],aux[1],aux[2],aux[3]);
endmodule //funcao

module principal;
	//definir dados--------------
	reg [3:0]x, y;
	wire s;
	//-------------------------
	
	//instancia
	funcao funcao1(s,x,y);
	
	initial begin: start
		x = 4'b0000;
		y = 4'b1111;
	end
	
	initial begin: main
		$display("Exemplo0033 - Julio Machado - 435666");
		$display("LU's test - seleção entre operações or/and - nor/nand");
		$display("key: (0) - equals / (1) - different");
		$display("x \ty = s");
		$monitor("%4b \t%4b = %b",x,y,s);
		#1 x = 4'b0001; y = 4'b1110;
		#1 x = 4'b0010; y = 4'b1101;
		#1 x = 4'b0011; y = 4'b1100;
		#1 x = 4'b0100; y = 4'b1011;
		#1 x = 4'b0101; y = 4'b0101;
		#1 x = 4'b1010; y = 4'b1010;
		
	end
endmodule //principal