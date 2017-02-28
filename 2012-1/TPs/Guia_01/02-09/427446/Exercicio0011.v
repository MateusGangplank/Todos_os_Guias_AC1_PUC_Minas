//--------------------------------------
//Exercicio0011 - NOR com 1 byte
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//---------------------------------------


//------------------
//-- nor gate
//------------------

module norgate(output s,input [7:0]p);
	assign s = ~(p[0]|p[1]|p[2]|p[3]|p[4]|p[5]|p[6]|p[7]);
endmodule //norgate

//--------------------
//-- test nor gate
//--------------------

module testnorgate;
	//------------ definir dados
	reg [7:0]a;	//definir registradores
	wire s;	//conexão(fio)
	
	//------------------- instancia
	norgate NOR1(s,a);
	
	//-------------------preparacao
	initial begin:start
		a=8'b00000000;
	end
	
	//-------------------parte principal
	initial begin
		$display("Exercicio0011 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test NOR gate com 1 byte");
		$display("\nabcedfgh = s\n");
		$monitor("%8b = %b",a,s);
		#1 a=8'b00000001;
		#1 a=8'b00000010;
		#1 a=8'b00000100;
		#1 a=8'b00001000;
		#1 a=8'b00010000;
		#1 a=8'b00100000;
		#1 a=8'b01000000;
		#1 a=8'b10000000;
		#1 a=8'b00000011;
		#1 a=8'b00000110;
		#1 a=8'b00001100;
		#1 a=8'b00011000;
		#1 a=8'b00110000;
		#1 a=8'b01100000;
		#1 a=8'b11000000;
		#1 a=8'b00000101;
		#1 a=8'b00001010;
		#1 a=8'b00010100;
		#1 a=8'b00101000;
		#1 a=8'b01010000;
		#1 a=8'b10100000;
		#1 a=8'b00001001;
		#1 a=8'b00010010;
		#1 a=8'b00100100;
		#1 a=8'b01001000;
		#1 a=8'b10010000;
		#1 a=8'b00010001;
		#1 a=8'b00100010;
		#1 a=8'b01000100;
		#1 a=8'b10001000;
		#1 a=8'b00100001;
		#1 a=8'b01000010;
		#1 a=8'b10000100;
		#1 a=8'b01000001;
		#1 a=8'b10000010;
		#1 a=8'b10000001;
	end

endmodule//testnorgate
