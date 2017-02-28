//---------------------
//-- Guia_05
//-- Nome: Júnior
//-- Matricula: 405807
//---------------------

//Exercício 01
//meia-soma normal
module halfadder(s, c, a, b);
	input  a, b;//variaveis
	output s, c;//s = saida, c = cout
	
	xor XOR1 (s, a, b);
	and AND1 (c, a, b);
	
endmodule 

//soma-completa
module fulladder (s,cout,cin,a,b);
	input  cin, a, b;
	output s, cout;
	
	wire s10,s11,s21;
	
	halfadder HALF1 (s10,s11,a,b);
	halfadder HALF2 (s,s21,cin,s10);
	or 		 OR1   (cout,s11,s21);
	
endmodule


module ex01 ( s, a, b );
	output[3:0] s;//sinal não considerado
	input[2:0]  a, b;
	
	wire cout1,cout2;
	
	halfadder HALF1 (s[0],cout1,a[0],b[0]);
	fulladder FULL1 (s[1],cout2,cout1,a[1],b[1]);
	fulladder FULL2 (s[2],s[3],cout2,a[2],b[2]);
	
endmodule


//Exercício 02
//meia-subtração normal
module halfsub (s, bout, a, b);
	input  a, b;
	output s, bout;
	
	wire s0, na;
	
	xor XOR1 (   s, a, b);
	not NOT1 (  na, a);
	and AND1 (bout,na, b);
	
endmodule

//subtração completa
module fullsub (s0, s1, bin, a, b);
	input  bin, a, b;
	output s0, s1;
	
	wire s2,
		 bout0, bout1;
	
	halfsub SUB1 (s2,bout0, a,  b);
	halfsub SUB2 (s0,bout1,s2,bin);
	or      OR1  (s1,bout0, bout1);

endmodule

module ex02 ( s, a, b );
	output[2:0] s;
	input[1:0]  a, b;
	
	wire bout1;
	
	halfsub HALF1 (s[0],bout1,a[0],b[0]);
	fullsub FULL2 (s[1],s[2],bout1,a[1],b[1]);
	
endmodule

//exercício 03
module ex03	 ( s, a, b );
	output[3:0] s;
	input[1:0]  a, b;
	
	wire and2,and3,and4;
	wire cout1,cout2;

	and AND1 (s[0],a[0],b[0]);
	and AND2 (and2,a[1],b[0]);
	and AND3 (and3,a[0],b[1]);
	
	halfadder HALF1 (s[1],cout1,and2,and3);
	
	and 		 AND4  (and4,a[1],b[1]);
	halfadder HALF2 (s[2],s[3],cout1,and4);

	
endmodule 

module testes;

	reg[2:0] a, b;//ex01
	reg[1:0] c, d,//ex02
				e, f;//ex03
	
	wire[3:0] ex1,//ex01
				 ex3;//ex03
	wire[2:0] ex2;//ex02
				 

	ex01 EX1 (ex1, a, b);
	ex02 EX2 (ex2, c, d);
	ex03 EX3 (ex3, e, f);

		 
	initial begin
		#1 $display("Testes do exercicio 01");
		   a = 3'b000; b = 3'b000;
		#1 $monitor("%3b + %3b = %4b",a, b, ex1);
		#1 a = 3'b001; b = 3'b000;
		#1 a = 3'b010; b = 3'b000;
		#1 a = 3'b011; b = 3'b000;
		#1 a = 3'b111; b = 3'b000;
		#1 a = 3'b000; b = 3'b001;
		#1 a = 3'b001; b = 3'b001;
		#1 a = 3'b010; b = 3'b001;
		#1 a = 3'b011; b = 3'b001;
		#1 a = 3'b111; b = 3'b001;
		#1 a = 3'b000; b = 3'b010;
		#1 a = 3'b001; b = 3'b010;
		#1 a = 3'b010; b = 3'b010;
		#1 a = 3'b011; b = 3'b010;
		#1 a = 3'b111; b = 3'b010;
		#1 a = 3'b000; b = 3'b011;
		#1 a = 3'b001; b = 3'b011;
		#1 a = 3'b010; b = 3'b011;
		#1 a = 3'b011; b = 3'b011;
		#1 a = 3'b111; b = 3'b011;
		#1 a = 3'b000; b = 3'b111;
		#1 a = 3'b001; b = 3'b111;
		#1 a = 3'b010; b = 3'b111;
		#1 a = 3'b011; b = 3'b111;
		#1 a = 3'b111; b = 3'b111;

		#1 $display("");		
		#1 $display("Testes do exercicio 02");
		   c = 2'b00; d = 4'b00;
		#1 $monitor("%2b - %2b = %3b",c, d, ex2);
		#1 c = 2'b01; d = 2'b00;
		#1 c = 2'b10; d = 2'b00;
		#1 c = 2'b11; d = 2'b00;
		#1 c = 2'b00; d = 2'b01;
		#1 c = 2'b01; d = 2'b01;
		#1 c = 2'b10; d = 2'b01;
		#1 c = 2'b11; d = 2'b01;
		#1 c = 2'b00; d = 2'b11;
		#1 c = 2'b01; d = 2'b11;
		#1 c = 2'b10; d = 2'b11;
		#1 c = 2'b11; d = 2'b11;
		
		#1 $display("");
		#1 $display("Testes do exercicio 03");
		   e = 2'b00; f = 2'b00;
		#1 $monitor("%2b * %2b = %4b",e, f, ex3);
		#1 e = 2'b01; f = 2'b00;
		#1 e = 2'b10; f = 2'b00;
		#1 e = 2'b11; f = 2'b00;
		#1 e = 2'b00; f = 2'b01;
		#1 e = 2'b01; f = 2'b01;
		#1 e = 2'b10; f = 2'b01;
		#1 e = 2'b11; f = 2'b01;		
		#1 e = 2'b00; f = 2'b11;
		#1 e = 2'b01; f = 2'b11;
		#1 e = 2'b10; f = 2'b11;
		#1 e = 2'b11; f = 2'b11;		
	
	end
	
endmodule