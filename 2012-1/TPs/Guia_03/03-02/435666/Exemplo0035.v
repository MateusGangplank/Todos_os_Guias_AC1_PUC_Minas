//-----------------------------------------------------
//Exemplo0035 - seleção de operações com chave de 3 bits
// Nome: Julio Machado
// Matrícula: 435666
//------------------------------------------------------


module funcao(output [1:0]s0, input [1:0]a, input [1:0]b, input [2:0]key);
	wire [15:0] s;
	
	not not1(s[0],a[0]);
	not not2(s[1],a[1]);
	not not3(s[2],b[0]);
	not not4(s[3],b[1]);
	
	or or1(s[4],a[0],b[0]);
	or or2(s[5],a[1],b[1]);
	nor nor1(s[6],a[0],b[0]);
	nor nor2(s[7],a[1],b[1]);
	and and1(s[8],a[0],b[0]);
	and and2(s[9],a[1],b[1]);
	nand nand1(s[10],a[0],b[0]);
	nand nand2(s[11],a[1],b[1]);
	xor xor1(s[12],a[0],b[0]);
	xor xor2(s[13],a[1],b[1]);
	xnor xnor1(s[14],a[0],b[0]);
	xnor xnor2(s[15],a[1],b[1]);
	
	chave chave1(s0,key,s[1:0],s[3:2],s[5:4],s[7:6],s[9:8],s[11:10],s[13:12],s[15:14]);
	
endmodule //funcao

module chave(s,key,s0,s1,s2,s3,s4,s5,s6,s7);
	output[1:0]s;
	reg[1:0]s;
	input [1:0]s0,s1,s2,s3,s4,s5,s6,s7;
	input[2:0]key;
	
	always @ (s0 or s1 or s2 or s3 or s4 or s5 or s6 or s7 or key)
	
	begin
		if(key == 3'b000)
			s = s0;
		else if(key == 3'b001)
			s = s1;
		else if(key == 3'b010)
			s = s2;
		else if(key == 3'b011)
			s = s3;
		else if(key == 3'b100)
			s = s4;
		else if(key == 3'b101)
			s = s5;
		else if(key == 3'b110)
			s = s6;
		else if(key == 3'b111)
			s = s7;
	end

endmodule //chave

module principal;
	//definir dados
	reg[1:0]x,y;
	reg[2:0]key;
	wire[1:0]s;
	
	//instancia
	funcao funcao1(s,x,y,key);
	
	initial begin:start
		x = 2'b00;
		y = 2'b00;
		key = 3'b000;
	end
	
	initial begin:main
		$display("Exemplo0035 -Julio Machado - 435666");
		$display("LU's test - seleção entre operações com chave de 3 bits");
		$display("key: (000)- not(a), (001) - not(b), (010) - or, (011) - nor");
		$display("\t(100) - and, (101) - nand , (110) - xor, (111) - xnor");
		$display("\t\t  t \t key \t x - y = s\n");
		$monitor("%d \t %3b \t %2b - %2b = %2b",$time,key,x,y,s);
		
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 1;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 2;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 3;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; x = 1; y = 0;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 1;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 2;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 3;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; x = 2; y = 0;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 1;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 2;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 3;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; x = 3; y = 0;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 1;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 2;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
		#1 key = 0; y = 3;
		#1 key = 1;
		#1 key = 2;
		#1 key = 3;
		#1 key = 4;
		#1 key = 5;
		#1 key = 6;
		#1 key = 7;
		
	end
endmodule //principal