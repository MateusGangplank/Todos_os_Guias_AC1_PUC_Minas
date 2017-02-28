
// Exemplo0025 – ComplementoDe2_3bits
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

// comparador de diferenca 3 bits

//--meia soma
module meiaSoma(output carry_out, output s, input a, input b);
	xor(s, a, b);
	and(carry_out, a, b);
endmodule

//--somador completo
module somador(output carry_out, output s, input a, input b, input carry_in);
	wire co1,s1, co2;
	meiaSoma MS1 (co1, s1, a, b);
	meiaSoma MS2 (co2, s, s1,carry_in);
	or(carry_out, co1, co2);
endmodule

//--somador para 3bits
module somador3(output carry_out, output[2:0] s, input[2:0] a, input[2:0] b, input carry_in);
	wire co1, co2;
	somador S0(co1, s[0], a[0], b[0], carry_in);
	somador S1(co2, s[1], a[1], b[1], co1);
	somador s2(carry_out, s[2], a[2], b[2], co2);
endmodule

//--not para 3 bits
module not3(output[2:0] s, input[2:0] a);
	not(s[0],a[0]);
	not(s[1],a[1]);
	not(s[2],a[2]);
endmodule

//--complemento de 2
module complemento2(output[2:0] s, input[2:0] a);
	wire[2:0] n;
	wire c;
	not3 N3(n, a);
	somador3 S(c, s, 3'b000, n, 1);
endmodule

//--teste
module testcomplemento2;

//--instancias
reg[2:0] x;
wire[2:0] s;

complemento2 C2(s,x);

initial begin
$display("Exemplo - 0025 Complemento2_3bits");
$display("Complementos de 2:");
x = 3'b101;
$monitor("a: %b\ts: %b", x, s);
#1 x = 3'b110;
#1 x = 3'b000;
#1 x = 3'b101;
#1 x = 3'b010;

end
endmodule