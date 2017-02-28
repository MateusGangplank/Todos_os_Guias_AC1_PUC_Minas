
// ------------------------- 
// Exemplo0033
// Nome: Luiz Marques de Oliveira
// Matricula: 417138
// ------------------------- 


module Ex_03(cout, s, a, b);

	output[5:0] s;
	output cout;
	input[5:0] a, b;
	wire alu1, alu2, alu3,alu4,alu5;

	halfAdder HALFADDER1(alu1, s[0], a[0], b[0]);
	fullAdder FULLADDER1(alu2, s[1], alu1, a[1], b[1]);
	fullAdder FULLADDER2(alu3, s[2], alu2, a[2], b[2]);
	fullAdder FULLADDER3(alu4, s[3], alu3, a[3], b[3]);
	fullAdder FULLADDER4(alu5, s[4], alu4, a[4], b[4]);
	fullAdder FULLADDER5(cout, s[5], alu5, a[5], b[5]);
	
endmodule// fim exercicio03

module fullAdder(cout, s, cin, a, b);
	output cout, s;
	input cin, a, b;
	wire alu1, alu2, alu3;
	halfAdder HALFADDER1(alu2, alu1, a, b);
	halfAdder HALFADDER2(alu3, s, alu1, cin);
	or OR1(cout, alu3, alu2);
endmodule // fim full adder

module halfAdder(cout, s, a, b);
	output cout, s;
	input a, b;
	xor XOR1(s, a, b);
	and AND1(cout, a, b);
endmodule //fim half adder 

module incrementar(input[5:0] a, output[5:0] s);
xor xOr01(s[0],a[0],1);
xor xOr02(s[1],a[1]);
xor xOr03(s[2],a[2]);
xor xOr04(s[3],a[3]);
xor xOr05(s[4],a[4]);
xor xOr06(s[5],a[5]);
endmodule

module testeEx_03;
	reg[5:0] a, b;
	wire[5:0] s,s2;
	wire cout;
	
	Ex_03 FULL(cout, s, a, b);
	incrementar Inc(s,s2);
	
	initial begin
	
	a=101101;
	b=010010;
	
	$display("Exercicio 03 Luiz Marques de Oliveira - 417138");
	$display("Incremento de 1");
	#1 $display(" %b +- %b = %b  %b",a,b,s,cout);
	#1 $display("incremento de 1 = %b",s2);
   a=111101;
	b=000110;
	#1 $display(" %b +- %b = %b  %b",a,b,s,cout);
	#1 $display("incremento de 1 = %b",s2);
   a=100001;
	b=010011;
	#1 $display(" %b +- %b = %b  %b",a,b,s,cout);
	#1 $display("incremento de 1 = %b",s2);
		
	end
	endmodule//