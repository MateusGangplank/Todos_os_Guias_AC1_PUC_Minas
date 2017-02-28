//-----------------------------------------------------
//Exemplo0034 - Operações xor/xnor or/nor selecionaveis
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//------------------------------------------------------

//module operation

module operation(output [3:0]s1, output [3:0]s0, input[1:0]a, input[1:0]b);
	wire [3:0]s0;
	wire [3:0]s1;
	
	xor xor0(s1[0],a[0],b[0]);
	xor xor1(s1[1],a[1],b[1]);
	
	xnor xnor0(s1[2],a[0],b[0]);
	xnor xnor1(s1[3],a[1],b[1]);
	
	or or0(s0[0],a[0],b[0]);
	or or1(s0[1],a[1],b[1]);
	
	nor nor0(s0[2],a[0],b[0]);
	nor nor1(s0[3],a[1],b[1]);

endmodule //operation

//módulo chave

module chave(s,xorXnor,orNor,sinal);
	output [1:0]s;
	reg[1:0]s;
	input [3:0]xorXnor;
	input [3:0]orNor;
	input [1:0]sinal;
	
	always @(orNor or xorXnor or sinal)
	begin
		if(sinal == 2'b00)
				s = orNor[1:0];
		else if(sinal == 2'b01)
				s = orNor[3:2];
		else if(sinal == 2'b10)
				s = xorXnor[1:0];
		else
				s = xorXnor[3:2];
	end
			
endmodule //chave

module principal;
	//definir dados
	reg[1:0]a;
	reg[1:0]b;
	wire [3:0]w0;
	wire [3:0]w1;
	wire [1:0]s;
	
	reg [1:0]key;
	
		
	initial begin:start
		//valor inicial de a e b
		a = 2'b00;
		b = 2'b00;
		key = 2'b00;
	end
	
	//instanciar
	operation op1(w1,w0,a,b);
	chave chave1(s,w1,w0,key);

		
	//parte principal
	initial begin:main
		$display("Exemplo0034 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("LU's test - seleção entre operações or/and - nor/nand");
		$display("key: (00)- or\t(01) - nor\t(10) - xor\t(11) - xnor");
		
		$display("\n\t\tt \tkey \t a op b = s\n");
		$monitor("%d \t %b \t %2b op %2b = %2b",$time, key , a, b,s);
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b01; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b10; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b11; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		
		#1 a = 2'b01; b = 2'b00; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b01; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b10; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b11; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		
		#1 a = 2'b10; b = 2'b00; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b01; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b10; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b11; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		
		#1 a = 2'b11; b = 2'b00; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b01; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b10; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
		#1 b = 2'b11; key = 2'b00;
		#1 key = 2'b01;
		#1 key = 2'b10;
		#1 key = 2'b11;
	end
	
endmodule //principal