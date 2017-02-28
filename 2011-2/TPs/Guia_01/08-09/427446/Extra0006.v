//-------------------------------------------
// Extra006 - AND em um byte
// Nome: Mateus Guilherme do Carmo Cruz
// Matrícula: 427446
//---------------------------------------------

module notgate(output[7:0] s1, input [7:0] b);
	assign s1 = ~b;
endmodule

module andgate(output s2, input [7:0] a);
	assign s2 = a[0] & a[1] & a[2] & a[3] & a[4] & a[5] & a[6]& a[7];
endmodule

module principal;
	reg[0:7] a,b; //conexão
	wire[0:7]s1; //fio
	wire s2;	//fio
	
	//instancia
	notgate NOT1(s1,b);
	andgate AND1(s2, s1);
	
	//preparação
	initial begin:start
		b=8'b1111_1111;
	end
	
	//parte principal
	initial begin:main
		$display("Extra0006 - Operação com byte - Mateus Guilherme do Carmo Cruz - 427446");
		$display("\t	time\tnot= s1 op = s2\n");
		b=8'b1111_1111;
		$monitor("%d\t~(%b) = %b op = %b",$time, b, s1, s2);
		$display("s2 = %b",s2);
	#1 b=8'b111_1110;
	#2 b=8'b111_1101;
	end
endmodule