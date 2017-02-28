
// ------------------------- 
// Exemplo0031 - FULL ADDER AND SUBSTRACTOR 
// Nome: Thaise Souto Martins
// Matricula: 395504
// ------------------------- 
// ------------------------- 
// full adder & subtractor
// ------------------------- 


module Exercicio01(cout, s, a, b);
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
	
endmodule// fim exercicio01

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

module testeExercicio01;
	reg[5:0] a, b;
	wire[5:0] s;
	wire cout;
	
	Exercicio01 FULL(cout, s, a, b);
	
	initial begin
	
	a=101101;
	b=010010;
	
	$display("Exercicio 02 - Thaise Souto - 395504");
	$display("Verificar de resultado da operacao = 0");
	
	begin
	 	
	if(s == 000000)
	$display("= 0? sim");
	else
	$display("= 0? nao");
	end
	
	a=000000;
	b=000000;
	
	begin
	 	
	if(a == 0 && b == 0)
	$display("= 0? sim");
	else
	$display("= 0? nao");
	end


	end
	endmodule//---- fim exercicio01