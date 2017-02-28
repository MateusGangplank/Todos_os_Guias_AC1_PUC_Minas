//-- Miller - 449048
//-- Arquitetura de Coputadores
//-- Professor Theldo
//-- Guia 03
//-- Exercicio 4

//-- Portas AND
module S1 ( output[1:0]a,
            input[1:0]b,
            input[1:0]c,
				input[1:0]d );
				
assign a = b & c & d;
endmodule

module S2 ( output[1:0]d,
            input[1:0]e,
            input[1:0]f );
				
assign d = e & f;
endmodule

module S3 ( output[1:0]g,
            input[1:0]h,
            input[1:0]i,
				input[1:0]k );
				
assign g = h & i & k;
endmodule

module S4 ( output[1:0]j,
            input[1:0]k,
            input[1:0]l,
				input[1:0]m );
				
assign j = k & l & m;
endmodule



//-- Porta OR

module S5 ( output[1:0]m,
            input[1:0]n,
            input[1:0]o );
				
assign m = n | o;
endmodule


//-- Porta XOR
module S6 ( output[1:0]p,
            input[1:0]q,
            input[1:0]r );
				
assign p = q ^ r;
endmodule

//-- Porta XNOR
module S7 ( output[1:0]s,
            input[1:0]t,
            input[1:0]u );
				
assign s = ~(t^u);
endmodule


//-- Porta NOR 
module S8 ( output[1:0]w,
            input[1:0]y,
            input[1:0]a );
				
assign w = ~(y|a);
endmodule


//-- Porta OR *4 Entradas * SAIDA FINAL
module S9 ( output[1:0]a,
            input[1:0]b,
				input[1:0]c,
            input[1:0]d,
            input[1:0]e );
				
assign a = b | c | d | e;
endmodule



module exec4;


reg	[1:0] a;//-- Entrada A
reg	[1:0] b;//-- Entrada B
reg	[1:0] c;//-- Chave 00/11
wire	[1:0] d;
wire	[1:0] e;
wire	[1:0] f;
wire	[1:0] g;
wire	[1:0] h;
wire	[1:0] i;
wire	[1:0] j;
wire	[1:0] k;
wire	[1:0] m;


S5 modulo5(d, a, b);//-- OR
S1 modulo1(e, d, ~c, ~c);//-- AND

S8 modulo8(f, a, b);//-- NOR
S2 modulo2(g, c, ~c);//-- AND

S6 modulo6(h, a, b);//-- XOR
S3 modulo3(i, h, c, ~c);//-- AND 

S7 modulo7(j, a, b);//-- XNOR
S4 modulo4(k, j, c, c);//--AND

S9 modulo9(m, k, i, g, e);//-- SAIDA

initial begin:start
c=2'b00; a=00; b=00;
end

initial begin 
$display("Miller - 449048"); 
$display("Guia 3 - Exercicio 4");
$display("Chave 00 = Porta OR");
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, m);
#1	a=2'b00; b=2'b01;
#1	a=2'b10; b=2'b01;
#1	a=2'b01; b=2'b01;
#1	a=2'b10; b=2'b00;
#1	a=2'b00; b=2'b11;
#1	a=2'b11; b=2'b01;
#1	a=2'b10; b=2'b10;
#1	a=2'b11; b=2'b11;
#1


$display("");
$display("Chave 01 = Porta NOR");
#2 c=2'b01; a=00; b=00;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, m);
#2	a=2'b00; b=2'b01;
#2	a=2'b10; b=2'b01;
#2	a=2'b01; b=2'b01;
#2	a=2'b10; b=2'b00;
#2	a=2'b00; b=2'b11;
#2	a=2'b11; b=2'b01;
#2	a=2'b10; b=2'b10;
#2	a=2'b11; b=2'b11;
#2


$display("");
$display("Chave 10 = Porta XOR");
#3 c=2'b10; a=00; b=00;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, m);
#3	a=2'b00; b=2'b01;
#3	a=2'b10; b=2'b01;
#3	a=2'b01; b=2'b01;
#3	a=2'b10; b=2'b00;
#3	a=2'b00; b=2'b11;
#3	a=2'b11; b=2'b01;
#3	a=2'b10; b=2'b10;
#3	a=2'b11; b=2'b11;
#3

$display("");
$display("Chave 11 = Porta XNOR");
#4 c=2'b11; a=00; b=00;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, m);
#4	a=2'b00; b=2'b01;
#4	a=2'b10; b=2'b01;
#4	a=2'b01; b=2'b01;
#4	a=2'b10; b=2'b00;
#4	a=2'b00; b=2'b11;
#4	a=2'b11; b=2'b01;
#4	a=2'b10; b=2'b10;
#4	a=2'b11; b=2'b11;

end
endmodule

//-- Theldo deu erro nas portas 01 e 00, eu nao sei como que separa uma entrada de 2 bits
//-- para 2 saidas de 1 bit cada e depois juntar 2 saidas de 1 bit cada e formar uma de 2.