// ------------------------------------
// Exemplo0047 - IGUALDADE/DIFEREN�A
// Nome:Guilherme Diniz de Assump��o
// Matricula: 462269
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

module funcao(output s, input [2:0]a,
					input[2:0]b, input key);
	wire [2:0]aux;
	wire aux1, aux2;
	xnor xnor1(aux[0],a[0],b[0]);
	xnor xnor2(aux[1],a[1],b[1]);
	xnor xnor3(aux[2],a[2],b[2]);
	
	and and1(aux1,aux[0],aux[1],aux[2]);
	not not1(aux2,aux1);
	
	chave key1(s,aux1,aux2,key);               // USAR APENAS PORTAS !
	
endmodule //funcao

module principal;
	reg [2:0]a,b;
	reg key;
	wire s;
	
	funcao f1(s,a,b,key);
	
	initial begin
		key = 0; a = 3'b000; b = 3'b000;
		$display("Exemplo0027 - Guilherme Diniz de Assump��o - 462269"); 
		$display("Test LU's equals/different");
		$display("key = 0 (equals), key = 1 (different)");
		$display("\t\t\tt - key a - b = s");
		$monitor("%d - %b %4b - %4b = %b",$time,key,a,b,s);
		
		#1 key = 1;
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 4'b111;
		#1 key = 1;
		
		#1 key = 0; a = 3'b001; b = 3'b000;
		#1 key = 1;
		
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 3'b111;
		#1 key = 1;
				
		#1 key = 0; a = 3'b010; b = 3'b000;
		#1 key = 1;
		
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 3'b111;
		#1 key = 1;
		
		#1 key = 0; a = 3'b011; b = 3'b000;
		#1 key = 1;
		
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 3'b111;
		#1 key = 1;
		
		#1 key = 0; a = 3'b100; b = 3'b000;
		#1 key = 1;
		
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 3'b111;
		#1 key = 1;
		
		#1 key = 0; a = 3'b101; b = 3'b000;
		#1 key = 1;
		
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 3'b111;
		#1 key = 1;
		
		
		#1 key = 0; a = 3'b110; b = 3'b000;
		#1 key = 1;
		
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 3'b111;
		#1 key = 1;
		
		
		#1 key = 0; a = 3'b111; b = 3'b000;
		#1 key = 1;
		
		#1 key = 0; b = 3'b001;
		#1 key = 1;
		
		#1 key = 0; b = 3'b010;
		#1 key = 1;
		
		#1 key = 0; b = 3'b011;
		#1 key = 1;
		
		#1 key = 0; b = 3'b100;
		#1 key = 1;
		
		#1 key = 0; b = 3'b101;
		#1 key = 1;
		
		#1 key = 0; b = 3'b110;
		#1 key = 1;
		
		#1 key = 0; b = 3'b111;
		#1 key = 1;
		
	end
endmodule //principal