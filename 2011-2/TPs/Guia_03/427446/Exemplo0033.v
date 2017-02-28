//-----------------------------------------------------
//Exemplo0033 - Operações or/and nor/nand selecionaveis
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//------------------------------------------------------

//módulo operation

module operation(output [3:0]s3,output [3:0]s2, output [3:0]s1, output [3:0]s0, input[3:0]a, input[3:0]b);
	wire [3:0]s0;
	wire [3:0]s1;
	wire [3:0]s2;
	wire [3:0]s3;
	
	or or0(s0[0],a[0],b[0]);
	or or1(s0[1],a[1],b[1]);
	or or2(s0[2],a[2],b[2]);
	or or3(s0[3],a[3],b[3]);
	
	and and0(s1[0],a[0],b[0]);
	and and1(s1[1],a[1],b[1]);
	and and2(s1[2],a[2],b[2]);
	and and3(s1[3],a[3],b[3]);
	
	nor nor0(s2[0],a[0],b[0]);
	nor nor1(s2[1],a[1],b[1]);
	nor nor2(s2[2],a[2],b[2]);
	nor nor3(s2[3],a[3],b[3]);
	
	nand nand0(s3[0],a[0],b[0]);
	nand nand1(s3[1],a[1],b[1]);
	nand nand2(s3[2],a[2],b[2]);
	nand nand3(s3[3],a[3],b[3]);

endmodule //operation

//módulo chave

module chave(s,op3,op2,op1,op0,sinal);
	//op0 = or; op1 = and; op2 = nor; op3 = nand
	output [7:0]s;
	reg[7:0]s;
	input [3:0]op3;
	input [3:0]op2;
	input [3:0]op1;
	input [3:0]op0;
	input sinal;
	
	always @(op0 or op1 or op2 or op3 or sinal)
	begin
		if(~sinal)
			begin
				s[7:4] = op0;
				s[3:0] = op1;
			end
		else
			begin
				s[7:4] = op2;
				s[3:0] = op3;
			end
	end
			
endmodule //chave

module principal;
	//definir dados
	reg[3:0]a;
	reg[3:0]b;
	wire [3:0]w1;
	wire [3:0]w2;
	wire [3:0]w3;
	wire [3:0]w4;
	wire [7:0]s;
	reg key;
	
		
	initial begin:start
		//valor inicial de a e b
		a = 4'b0000;
		b = 4'b0000;
		key = 1'b0;
	end
	
	//instanciar
	operation op1(w4,w3,w2,w1,a,b);
	chave chave1(s,w4,w3,w2,w1,key);

		
	//parte principal
	initial begin:main
		$display("Exemplo0033 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("LU's test - seleção entre operações or/and - nor/nand");
		$display("a: %4b \t b: %4b", a,b);
		$display(" a or/and b \t ...  a nor/nand b = \ts");
		$monitor("%d op = %4b - %4b", $time, s[7:4], s[3:0]);
		#1 key = 1'b1;
		#1 a = 4'b0001; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 4'b0001; key = 1'b0;
		#1 key = 1'b1;
		#1 a = 4'b1111; b = 4'b1111; key = 1'b0;
		#1 key = 1'b1;
		
		
	end
	
endmodule //principal