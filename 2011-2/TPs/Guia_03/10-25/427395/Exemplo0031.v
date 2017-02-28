//Exemplo0031
//Nome: Eduardo Botelho
//Matricula: 427395

//f4_Gate

module f4 (output  s, input [3:0] a, input [3:0] b);

//descrever por portas
//(ab) + (a+b) será o equivalente a uma porta OR
//é necessário que haja comparaçao de bit a bit para se obter a resposta correta

//variáveis locais
	wire s1;
	wire s2;
	wire s3;
	wire s4;
	wire s5;
	wire s6;
	
	or (s1, a[3],b[3]);
	or (s2, a[2],b[2]);
	or (s3, a[1],b[1]);
	or (s4, a[0],b[0]);
	or (s5, s1, s2);
	or (s6, s3, s4);
	or (s, s5, s6);

endmodule

//modulo de testes
module test_f4;
	reg [3:0] x;
	reg [3:0] y;
	wire z;
	
	f4 LU (z,x,y);
	//parte principal
	initial begin
	$display("Exemplo0031 - Eduardo Botelho - 427395");
	$display("Test LU's Module");
	
	x = 4'b0000; y = 4'b0000;
	
	
	//projetar testes do modulo
	
	$monitor ("%3b %3b %3b",x,y,z);
	
	#1 x=4'b0000; y=4'b0001;
	#1 x=4'b0000; y=4'b0010;
	#1 x=4'b0000; y=4'b0011;
	#1 x=4'b0000; y=4'b0100;
	#1 x=4'b0000; y=4'b0101;
	#1 x=4'b0000; y=4'b0110;
	#1 x=4'b0000; y=4'b0111;
	#1 x=4'b0000; y=4'b1000;
	#1 x=4'b0000; y=4'b1001;
	#1 x=4'b0000; y=4'b1010;
	#1 x=4'b0000; y=4'b1011;
	#1 x=4'b0000; y=4'b1100;
	#1 x=4'b0000; y=4'b1101;
	#1 x=4'b0000; y=4'b1110;
	#1 x=4'b0000; y=4'b1111;
	
	//qualquer valor diferente de x=0000, y=0000, dará resultado 1
	end
endmodule
