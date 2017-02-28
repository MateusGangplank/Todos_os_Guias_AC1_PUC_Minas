// -------------------------
// Exercicio001 - nor
// Nome: Guilherme Diniz de Assumpcao
// Matricula: 462269
// -------------------------

module norgateByte (output s, input [7:0]a);
assign s = ~(a[0]|a[1]|a[2]|a[3]|a[4]|a[5]|a[6]|a[7]);
endmodule


module testeNor;

wire s;
reg [7:0]a;

norgateByte NO1 (s,a);

initial begin:start

a=8'b00000000;

end

initial begin:main
$display("Exercicio 011 - Guilherme Diniz de Assumpcao - 462269 ");
$display("Test nor:");
$monitor("%d\t%8b = %b", $time, a,s);
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
		endmodule