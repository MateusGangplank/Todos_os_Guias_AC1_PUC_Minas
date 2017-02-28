//-----------------------------------------------------
//Exemplo0033 - Operações or/and nor/nand selecionaveis
//Nome: Silvino Henrique Santos de Souza 
//Matrícula: 412773
//------------------------------------------------------

module operation(output [3:0]s1, output [3:0]s0, input[1:0]a, input[1:0]b);
	wire [3:0]s0;
	wire [3:0]s1;
	
	or or0(s0[0],a[0],b[0]);
	or or1(s0[1],a[1],b[1]);
	
	and and0(s0[2],a[0],b[0]);
	and and1(s0[3],a[1],b[1]);
	
	nor nor0(s1[0],a[0],b[0]);
	nor nor1(s1[1],a[1],b[1]);
	
	nand nand0(s1[2],a[0],b[0]);
	nand nand1(s1[3],a[1],b[1]);

endmodule //operation

module chave(s,norNand,orAnd,sinal);
	output [3:0]s;
	reg[3:0]s;
	input [3:0]orAnd;
	input [3:0]norNand;
	input sinal;
	
	always @(orAnd or norNand or sinal)
	begin
		if(~sinal)
			begin
				s = orAnd;
			end
		else
			begin
				s = norNand;
			end
	end
			
endmodule //chave

module principal;
	reg[1:0]a;
	reg[1:0]b;
	wire [3:0]w0;
	wire [3:0]w1;
	wire [3:0]s;
	
	reg key;
	
		
	initial begin:start
		a = 2'b00;
		b = 2'b00;
		key = 1'b0;
	end

	operation op1(w1,w0,a,b);
	chave chave1(s,w1,w0,key);

	initial begin:main
		$display("Exemplo0033 - Silvino Henrique Santos de Souza - 412773");
		$display("LU's test - seleção entre operações or/and - nor/nand");
		$display("key: (0)- or/and \t (1) - nor/nand");
		
		$display("key \t a op. b = s0 - s1\n");
		$monitor("%b \t %2b op %2b =  %2b - %2b",key , a, b, s[1:0], s[3:2]);
		
		#1 key = 1'b1;
		#1 b = 2'b01; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b10; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b11; key = 1'b0;
		#1 key = 1'b1;
		
		#1 a = 2'b01; b = 2'b00; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b01; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b10; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b11; key = 1'b0;
		#1 key = 1'b1;
		
		#1 a = 2'b10; b = 2'b00; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b01; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b10; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b11; key = 1'b0;
		#1 key = 1'b1;
		
		#1 a = 2'b11; b = 2'b00; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b01; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b10; key = 1'b0;
		#1 key = 1'b1;
		#1 b = 2'b11; key = 1'b0;
		#1 key = 1'b1;
	end
	
endmodule //principal