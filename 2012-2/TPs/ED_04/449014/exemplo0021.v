
// Exemplo0021 – SOMADOR_3bits
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// somador 3 bits

//--meia soma
module meiaSoma(output carry_out,output s,input a,input b);
	xor(s,a,b);
	and(carry_out,a,b);
endmodule 

//--somador completo
module somador(output carry_out, output s, input a, input b, carry_in);
		wire s1, co1, co2;
		meiaSoma MS1 (co1, s1, a, b);
		meiaSoma MS2 (co2, s, s1, carry_in);
		or(carry_out, co2, co1);
endmodule

//--somador 3bits
module somador3bits (output carry_out, output[2:0] s,
 input[2:0] a, input[2:0] b, input carry_in);

	wire co1,co2,co3;
	somador S0 (co1, s[0], a[0], b[0], carry_in);
	somador S1 (co2, s[1], a[1], b[1], co1);
	somador S2 (carry_out, s[2], a[2], b[2], co2);
endmodule

//--teste
module testSomador;

//--instancias
reg carryIn;
reg [2:0] x;
reg [2:0] y;
wire [2:0] soma;
wire carryOut;

somador3bits S3b (carryOut, soma, x, y, carryIn);

initial begin
$display("Exemplo0021 - Átila Martins Silva Júnior - 449014");
$display("Test ALU’s Soma 3 bits");
carryIn = 0; x = 3'b001; y = 3'b001; 
$monitor("carry_in: %b\ta: %b\tb: %b\ts: %b\tcarry_out: %b",carryIn, x, y, soma, carryOut);
#1 carryIn = 0; x = 3'b101; y = 3'b001; 
#1 carryIn = 0; x = 3'b111; y = 3'b001;
#1 carryIn = 1; x = 3'b101; y = 3'b101;
#1 carryIn = 1; x = 3'b100; y = 3'b011;
end
endmodule