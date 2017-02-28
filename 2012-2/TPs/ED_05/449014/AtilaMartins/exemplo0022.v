
// Exemplo0022 – SUBTRATOR_3bits
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// subtrator 3 bits

//--meia diferença
module meiaDiferenca(output carry_out,output s,input a,input b);
	wire w;
	xor(s,a,b);
	not(w,a);
	and(carry_out,w,b);
endmodule 

//--subtrator completo
module subtrator(output carry_out, output s, input a, input b, carry_in);
		wire s1, co1, co2;
		meiaDiferenca MD1 (co1, s1, a, b);
		meiaDiferenca MD2 (co2, s, s1, carry_in);
		or(carry_out, co2, co1);
endmodule

//--subtrator para 3bits
module subtrator3bits (output carry_out, output[2:0] s,
 input[2:0] a, input[2:0] b, input carry_in);

	wire co1,co2,co3;
	subtrator S0 (co1, s[0], a[0], b[0], carry_in);
	subtrator S1 (co2, s[1], a[1], b[1], co1);
	subtrator S2 (carry_out, s[2], a[2], b[2], co2);
endmodule

//--teste
module testSubtrator;

//--instancias
reg carryIn;
reg [2:0] x;
reg [2:0] y;
wire [2:0] diferenca;
wire carryOut;

subtrator3bits S3b (carryOut, diferenca, x, y, carryIn);

initial begin
$display("Exemplo0022 - Átila Martins Silva Júnior - 449014");
$display("Test ALU’s Subtracao 3 bits");
carryIn = 0; x = 3'b001; y = 3'b001; 
$monitor("carry_in: %b\ta: %b\tb: %b\ts: %b\tcarry_out: %b",carryIn, x, y, diferenca, carryOut);
#1 carryIn = 0; x = 3'b101; y = 3'b001; 
#1 carryIn = 0; x = 3'b111; y = 3'b001;
#1 carryIn = 1; x = 3'b101; y = 3'b101;
#1 carryIn = 1; x = 3'b100; y = 3'b011;
end
endmodule