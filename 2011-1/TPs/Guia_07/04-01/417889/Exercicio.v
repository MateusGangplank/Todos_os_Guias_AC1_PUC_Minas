module soma5Bits(s, a, b);
	output[5:0] s;
	input[4:0] a, b;
	wire t1, t2, t3, t4;
	meiaSoma HALFADDER1(t1, s[0], a[0], b[0]);
	somaCompleta FULLADDER1(t2, s[1], t1, a[1], b[1]);
	somaCompleta FULLADDER2(t3, s[2], t2, a[2], b[2]);
	somaCompleta FULLADDER3(t4, s[3], t3, a[3], b[3]);
	somaCompleta FULLADDER4(s[5], s[4], t4, a[4], b[4]);
endmodule

module somaCompleta(cout, s, cin, a, b);
	output cout, s;
	input cin, a, b;
	wire t1, t2, t3;
	meiaSoma HALFADDER1(t2, t1, a, b);
	meiaSoma HALFADDER2(t3, s, t1, cin);
	or OR1(cout, t3, t2);
endmodule

module meiaSoma(cout, s, a, b);
	output cout, s;
	input a, b;
	xor XOR1(s, a, b);
	and AND1(cout, a, b);
endmodule

module diferenca5Bits(d, a, b);
	output[5:0] d;
	input[4:0] a, b;
	wire t1, t2, t3, t4;
	meiaDiferenca HALFSUBTRACTOR1(t1, d[0], a[0], b[0]);
	diferencaCompleta FULLSUBTRACTOR1(t2, d[1], t1, a[1], b[1]);
	diferencaCompleta FULLSUBTRACTOR2(t3, d[2], t2, a[2], b[2]);
	diferencaCompleta FULLSUBTRACTOR3(t4, d[3], t3, a[3], b[3]);
	diferencaCompleta FULLSUBTRACTOR4(d[5], d[4], t4, a[4], b[4]);
endmodule

module diferencaCompleta(vout, d, vin, a, b);
	output vout, d;
	input vin, a, b;
	wire t1, t2, t3;
	meiaDiferenca HALFSUBTRACTOR1(t2, t1, a, b);
	meiaDiferenca HALFSUBTRACTOR2(t3, d, t1, vin);
	or OR1(vout, t3, t2);
endmodule

module meiaDiferenca(vout, d, a, b);
	output vout, d;
	input a, b;
	wire na;
	xor XOR1(d, a, b);
	not NOT1(na, a);
	and AND1(vout, na, b);
endmodule

module complemento1(s, a);
	output[4:0] s;
	input[4:0] a;
	not NOT1(s[0], a[0]);
	not NOT2(s[1], a[1]);
	not NOT3(s[2], a[2]);
	not NOT4(s[3], a[3]);
	not NOT5(s[4], a[4]);
endmodule

module andLogico(s, a, b);
	output[4:0] s;
	input[4:0] a, b;
	and AND1(s[0], a[0], b[0]);
	and AND2(s[1], a[1], b[1]);
	and AND3(s[2], a[2], b[2]);
	and AND4(s[3], a[3], b[3]);
	and AND5(s[4], a[4], b[4]);
endmodule

module ouLogico(s, a, b);
	output[4:0] s;
	input[4:0] a, b;
	or OR1(s[0], a[0], b[0]);
	or OR2(s[1], a[1], b[1]);
	or OR3(s[2], a[2], b[2]);
	or OR4(s[3], a[3], b[3]);
	or OR5(s[4], a[4], b[4]);
endmodule

module comparadorAritmetico(aMaiorB, bMaiorA, a, b, diferenca, aIgualB);
	output aMaiorB, bMaiorA;
	input[5:0] diferenca;
	input[4:0] a, b;
	input aIgualB;
	wire nb, t1, t2, t3;
	and AND1(t1, a[4], ~b[4]);
	and AND2(t2, a[4], diferenca[4]);
	and AND3(t3, ~b[4], diferenca[4]);
	or OR1(bMaiorA, t1, t2, t3);
	nor NOR1(aMaiorB, bMaiorA, aIgualB);
endmodule

module flagSinal(flag, a, b, op, resultado);
	output flag;
	input[5:0] resultado;
	input[4:0] a, b;
	input op;
	wire t1, t2, t3, t4, t5;
	and AND1(t1, a[4], resultado[4]);
	and AND2(t2, a[4], b[4], ~op);
	and AND3(t3, b[4], ~op, result[4]);
	and AND4(t4, ~b[4], op, result[4]);
	and AND5(t5, a[4], ~b[4], op);
	or OR1(flag, t1, t2, t3, t4, t5);
endmodule

module flagOverflow(flag, a, b, op, resultado);
	output flag;
	input[5:0] resultado;
	input[4:0] a, b;
	input op;
	wire t1, t2, t3, t4;
	and AND1(t1, a[4], b[4], ~op, ~resultado[4]);
	and AND2(t2, ~a[4], ~b[4], ~op, resultado[4]);
	and AND3(t3, ~a[4], b[4], op, resultado[4];
	and AND4(t4, a[4], ~b[4], op, ~resultado[4];
	or OR1(flag, t1, t2, t3, t4);
endmodule

module comparadorLogico(aIgualB, aDiferenteB, a, b);
	output aIgualB, aDiferenteB;
	input[4:0] a, b;
	wire t1, t2, t3, t4, t5;
	xnor XNOR1(t1, a[0], b[0]);
	xnor XNOR2(t2, a[1], b[1]);
	xnor XNOR3(t3, a[2], b[2]);
	xnor XNOR4(t4, a[3], b[3]);
	xnor XNOR5(t5, a[4], b[4]);
	and AND1(aIgualB, t1, t2, t3, t4, t5);
	not(aDiferenteB, aIgualB);
endmodule

module complemento2(s, a);
	output[4:0] s;
	input[4:0] a;
	reg[4:0] b = 1;
	wire[5:0] soma;
	wire[4:0] c1a;
	complemento1 C1A(c1a, a);
	soma5Bits SOMA(soma, c1a, b);
	assign s[4:0] = soma[4:0];
endmodule

module incremento1(s, a);
	output[5:0] s;
	input[4:0] a;
	reg[4:0] b = 1;
	soma5Bits SOMA(s, a, b);
endmodule

module decremento1(s, a);
	output[5:0] s;
	input[4:0] a;
	reg[4:0] b = 1;
	diferenca5Bits DIFERENCA(s, a, b);
endmodule

module multiplica2(s, a);
	output[5:0] s;
	input[4:0] a;
	soma5Bits SOMA(s, a, a);
endmodule

module alu5Bits(resultado, sinal, overflow, aMaiorB, bMaiorA, aIgualB, aDifB, zero, carry, selecao, a, b);
	input[4:0] a, b;
	input[3:0] selecao;
	output reg[4:0] resultado;
	output sinal, overflow, aMaiorB, bMaiorA, aIgualB, aDifB, zero, carry;
	reg op;
	wire[5:0] soma, diferenca, tempResult;
	wire[4:0] andLogicoAB, orLogicoAB, complemento1a, complemento1b, complemento2a, complemento2b, incrementoA, incrementoB, mul2a, mul2b;

	always @(selecao) begin
		if((selecao>=4 && selecao<=8) || (selecao>=11 && selecao<=13))
			assign op = 0;
		else if(selecao==4'b1000 || selecao==4'b1001 || selecao==4'b1101)
			assign op = 1;
	end

	andLogico LOGICALAND(andLogicoAB, a, b);
	ouLogico LOGICALOR(orLogicoAB, a, b);
	complemento1 FIRSTCOMPLEMENT1(complemento1a, a);
	complemento1 FIRSTCOMPLEMENT2(complemento1b, b);
	complemento2 SECONDCOMPLEMENT1(complemento2a, a);
	complemento2 SECONDCOMPLEMENT2(complemento2b, b);
	incremento1 INCREMENT1(incrementoA, a);
	incremento1 INCREMENT2(incrementoB, b);
	decremento1 DECREMENT1(decrementoA, a);
	decremento1 DECREMENT2(decrementoB, b);
	multiplica2 MULTIPLY1(mul2A, a);
	multiplica2 MULTIPLY2(mul2B, b);
	soma5Bits ADDER5BITS(soma, a, b);
	diferenca5Bits SUBTRACTOR5BITS(diferenca, a, b);

	flagSinal SIGNALFLAG(sinal, a[4], b[4], op, diferenca[4]);
	flagOverflow OVERFLOWFLAG(overflow, a[4], b[4], op, diferenca[4]);
	bMaiorQueA BMAIORQUEA(bMaiorA, a[4], b[4], diferenca[4]);
	assign aMaiorQueB
	comparadorLogico AIGUALB(aIgualB, a, b);
	
	nor NOR1(aMaiorB, aIgualB, bMaiorA);

	always @(selecao) begin
		case(op)
			4'b0000: begin
				assign resultado = andLogicoAB;
			end
		endcase
	end

	assign carry = resultado[5];
	nor NOR2(zero, resultado[0], resultado[1], resultado[2], resultado[3], resultado[4], resultado[5]);

endmodule

/*
module teste;

	reg[4:0] a, b;
	wire[4:0] result;
	integer i, j, linha;

	initial begin
		a = 0;
		b = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio - Douglas Borges - 417889");
		$display("Circuito ALU 5 Bits com Sinal - Continuação\n");	

		for(i = 0; i < 32; i = i + 1)begin
			a = i;
			for(j = 0; j < 32; j = j + 1)begin
				#1 b = j; linha = linha + 1;
			end
		end
	end
	
	Execucao em arquivo anexo
	 
endmodule
*/