//---------------------------------------------------
//Exemplo0036 - Operações de igualdade e diferença selecionáveis
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//--------------------------------------------------------

module operation(output s,input [3:0]a, input[3:0]b);
	wire aux[3:0];
	xnor xnor1(aux[3],a[3],b[3]);
	xnor xnor2(aux[2],a[2],b[2]);
	xnor xnor3(aux[1],a[1],b[1]);
	xnor xnor4(aux[0],a[0],b[0]);
	
	and and1(s,aux[3],aux[2],aux[1],aux[0]);
	
endmodule//operation

module chave(s2, a, sinal);
	input a;
	input sinal;
	output s2;
	reg s2;
	
	always @(s2 or a or sinal)
	begin
		if(~sinal)
			s2 = a;
		else
			s2 = ~a;
	end
endmodule//chave

module principal;
	//definir dados
	reg[3:0]a;
	reg[3:0]b;
	wire s0;
	wire final;
	reg key;
	
	initial begin:start
		a = 4'b0000;
		b = 4'b0101;
		key = 1'b0;
	end
	
	//instanciar
	operation op1(s0,a,b);
	chave chave1(final,s0,key);
	
	initial begin:main
		$display("Exemplo0036 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("LU's test - operações de igualdade e diferença selecionáveis");
		$display("key = 0 (equals), key = 1(different)");
		$display("key : a - b = s");
		$monitor("%b : %4b - %4b = %b", key, a, b, final);
		#1 key = 1'b1;
		#1 a = 4'b0111; b = 4'b0111; key = 1'b0;
		#1 key = 1'b1;
	end
endmodule//principal