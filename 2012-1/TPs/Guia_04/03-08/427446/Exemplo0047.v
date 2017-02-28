// ------------------------------------
// Exemplo0047 - IGUALDADE/DIFERENÇA
// Nome:Mateus Guilherme do Carmo Cruz
// Matricula: 427446
// ------------------------------------

module chave(s,a,b,key);
	output s;
	reg s;
	input a;
	input b;
	input key;
	
	always @ (a or b or key)
		if(~key)
			s = a;
		else
			s = b;
endmodule //chave

module funcao(output s, input [3:0]a,
					input[3:0]b, input key);
	wire [3:0]aux;
	wire aux1, aux2;
	xnor xnor1(aux[0],a[0],b[0]);
	xnor xnor2(aux[1],a[1],b[1]);
	xnor xnor3(aux[2],a[2],b[2]);
	xnor xnor4(aux[3],a[3],b[3]);
	
	and and1(aux1,aux[0],aux[1],aux[2],aux[3]);
	not not1(aux2,aux1);
	
	chave key1(s,aux1,aux2,key);
	
endmodule //funcao

module principal;
	reg [3:0]a,b;
	reg key;
	wire s;
	
	funcao f1(s,a,b,key);
	
	initial begin
		key = 0; a = 4'b0000; b = 4'b0000;
		$display("Exemplo0046 - Mateus Guilherme do Carmo Cruz - 427446"); 
		$display("Test LU's equals/different");
		$display("key = 0 (equals), key = 1 (different)");
		$display("\t\t\tt - key a - b = s");
		$monitor("%d - %b %4b - %4b = %b",$time,key,a,b,s);
		
		#1 key = 1;
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b0001; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b0010; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b0011; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b0100; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b0101; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b0110; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b0111; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1000; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1001; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1010; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1011; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1100; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1101; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1110; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
		
		#1 key = 0; a = 4'b1111; b = 4'b0000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b0111;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1000;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1001;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1010;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1011;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1100;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1101;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b1111;
		#1 key = 1;
	end
endmodule //principal