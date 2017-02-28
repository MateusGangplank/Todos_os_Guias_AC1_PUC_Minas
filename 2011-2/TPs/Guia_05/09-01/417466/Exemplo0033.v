
// ------------------------- 
// Exemplo0031 - FULL ADDER AND SUBSTRACTOR 
// Nome: Jorge Luis dos Santos Leal 
// Matricula: 417466 
// ------------------------- 
// ------------------------- 
// full adder & subtractor
// ------------------------- 


module Exercicio03(cout, s, a, b);
//-----definir dados
	output[5:0] s;
	output cout;
	input[5:0] a, b;
	wire fio1, fio2, fio3,fio4,fio5;

	halfAdder HALFADDER1(fio1, s[0], a[0], b[0]);
	fullAdder FULLADDER1(fio2, s[1], fio1, a[1], b[1]);
	fullAdder FULLADDER2(fio3, s[2], fio2, a[2], b[2]);
	fullAdder FULLADDER3(fio4, s[3], fio3, a[3], b[3]);
	fullAdder FULLADDER4(fio5, s[4], fio4, a[4], b[4]);
	fullAdder FULLADDER5(cout, s[5], fio5, a[5], b[5]);
	
endmodule// fim exercicio03

module fullAdder(cout, s, cin, a, b);
	output cout, s;
	input cin, a, b;
	wire fio1, fio2, fio3;
	halfAdder HALFADDER1(fio2, fio1, a, b);
	halfAdder HALFADDER2(fio3, s, fio1, cin);
	or OR1(cout, fio3, fio2);
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

module testeExercicio03;
	reg[5:0] a, b;
	wire[5:0] s,s2;
	wire cout;
	
	Exercicio03 FULL(cout, s, a, b);
	incrementar Inc(s,s2);
	
	initial begin
	
	a=101101;
	b=010010;
	
	$display("Exercicio 03 - Jorge Luis - 417466");
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
	endmodule//---- fim exercicio01