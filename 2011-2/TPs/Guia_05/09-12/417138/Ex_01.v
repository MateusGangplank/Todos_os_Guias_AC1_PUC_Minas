
// ------------------------- 
// Exemplo0031
// Nome: Luiz Marques de Oliveira 
// Matricula: 417138
// ------------------------- 


module Ex_01(cout, s, a, b);

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
	
endmodule// fim eEx_01

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

module testeEx_01;
	reg[5:0] a, b;
	wire[5:0] s;
	wire cout;
	
	Ex_01 FULL(cout, s, a, b);
	
	initial begin
	
	a=101101;
	b=010010;
	
	$display("Exercicio 01 - Luiz Marques de oliveira - 417138");
	$display("Circuito Soma e Subtração");
	#1 $display(" %b +- %b = %b  %b",a,b,s,cout);
   a=111101;
	b=000110;
	#1 $display(" %b +- %b = %b  %b",a,b,s,cout);
   a=100001;
	b=010011;
	#1 $display(" %b +- %b = %b  %b",a,b,s,cout);
		
	end
	endmodule//