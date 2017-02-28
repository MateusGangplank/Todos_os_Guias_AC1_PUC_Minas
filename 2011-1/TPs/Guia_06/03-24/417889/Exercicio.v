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

module bMaiorQueA(s, sinalA, sinalB, sinalDiferenca);
	output s;
	input sinalA, sinalB, sinalDiferenca;
	wire nb, t1, t2, t3;
	not NOT1(nb, sinalB);
	and AND1(t1, sinalA, nb);
	and AND2(t2, sinalA, sinalDiferenca);
	and AND3(t3, nb, sinalDiferenca);
	or OR1(s, t1, t2, t3);
endmodule

module flagSinal(s, sinalA, sinalB, operacao, sinalResult);
	output s;
	input sinalA, sinalB, operacao, sinalResult;
	wire no, nb, t1, t2, t3, t4, t5;
	not NOT1(no, operacao);
	not NOT2(nb, sinalB);
	and AND1(t1, sinalA, sinalResult);
	and AND2(t2, sinalA, sinalB, no);
	and AND3(t3, sinalB, no, sinalResult);
	and AND4(t4, nb, operacao, sinalResult);
	and AND5(t5, sinalA, nb, operacao);
	or OR1(s, t1, t2, t3, t4, t5);
endmodule

module flagOverflow(s, sinalA, sinalB, operacao, sinalResult);
	output s;
	input sinalA, sinalB, operacao, sinalResult;
	wire na, nb, no, ns, t1, t2, t3, t4;
	not NOT1(na, sinalA);
	not NOT2(nb, sinalB);
	not NOT3(no, operacao);
	not NOT4(ns, sinalResult);
	and AND1(t1, sinalA, sinalB, no, ns);
	and AND2(t2, na, nb, no, sinalResult);
	and AND3(t3, na, sinalB, operacao, sinalResult);
	and AND4(t4, sinalA, nb, operacao, ns);
	or OR1(s, t1, t2, t3, t4);
endmodule

module comparadorLogico(s, a, b);
	output s;
	input[4:0] a, b;
	wire t1, t2, t3, t4, t5;
	xnor XNOR1(t1, a[0], b[0]);
	xnor XNOR2(t2, a[1], b[1]);
	xnor XNOR3(t3, a[2], b[2]);
	xnor XNOR4(t4, a[3], b[3]);
	xnor XNOR5(t5, a[4], b[4]);
	and AND1(s, t1, t2, t3, t4, t5);
endmodule

module alu5Bits;
	reg[5:0] resultado;
	reg[4:0] a, b;
	reg op;
	wire[5:0] soma, diferenca;
	wire[4:0] complemento1a, complemento1b, andLogicoAB, orLogicoAB;
	wire sinal, overflow, bMaiorA, aIgualB, aMaiorB, zero, carry;
	integer i, j, k, linha;
	soma5Bits ADDER5BITS(soma, a, b);
	diferenca5Bits SUBTRACTOR5BITS(diferenca, a, b);
	flagSinal SIGNALFLAG(sinal, a[4], b[4], op, diferenca[4]);
	flagOverflow OVERFLOWFLAG(overflow, a[4], b[4], op, diferenca[4]);
	bMaiorQueA BMAIORQUEA(bMaiorA, a[4], b[4], diferenca[4]);
	comparadorLogico AIGUALB(aIgualB, a, b);
	nor NOR1(aMaiorB, aIgualB, bMaiorA);
	andLogico LOGICALAND(andLogicoAB, a, b);
	ouLogico LOGICALOR(orLogicoAB, a, b);
	complemento1 FIRSTCOMPLEMENT1(complemento1a, a);
	complemento1 FIRSTCOMPLEMENT2(complemento1b, b);

	initial begin
		a = 0;
		b = 0;
		resultado = soma;
		op = 0;
		linha = -1;
	end

	always @(op==0)
			assign resultado = soma;
	always @(op==1)
			assign resultado = diferenca;
	
	assign carry = resultado[5];
	nor NOR2(zero, resultado[0], resultado[1], resultado[2], resultado[3], resultado[4], resultado[5]);

	initial begin
		$display("Exercicio - Douglas Borges - 417889");
		$display("Circuito ALU 5 Bits com Sinal\n");	

		$display("line op   a     b   resultado sinal overflow b>a a=b a>b zero carry complemento1a complemento1b andLogico orLogico");

		for(i = 0; i < 2; i = i + 1)begin
			op = i;
			for(j = 0; j < 32; j = j + 1)begin
				a = j;
				for(k = 0; k < 32; k = k + 1)begin
					#1 b = k; linha = linha + 1;
					#1 $display("%4d  %b %5b %5b  %5b     %b       %b     %b   %b   %b    %b    %b       %5b         %5b       %5b    %5b", linha, op, a, b, resultado, sinal, overflow, bMaiorA, aIgualB, aMaiorB, zero, carry, complemento1a, complemento1b, andLogicoAB, orLogicoAB);
				end
			end
		end
	end
/*
	Execucao em arquivo anexo
*/
endmodule