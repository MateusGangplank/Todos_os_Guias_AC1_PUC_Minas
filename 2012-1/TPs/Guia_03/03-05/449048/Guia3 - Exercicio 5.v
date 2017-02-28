//-- Miller - 449048
//-- Arquitetura de Coputadores
//-- Professor Theldo
//-- Guia 03
//-- Exercicio 5

//-- Portas AND ****
module S1 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c,
				input[2:0]d,
				input[2:0]e );
				
assign a = b & c & d & e;
endmodule

module S2 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c,
				input[2:0]d,
				input[2:0]e );
				
assign a = b & c & d & e;
endmodule

module S3 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c,
				input[2:0]d,
				input[2:0]e );
				
assign a = b & c & d & e;
endmodule

module S4 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c,
				input[2:0]d,
				input[2:0]e );
				
assign a = b & c & d & e;
endmodule

module S5 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c,
				input[2:0]d,
				input[2:0]e );
				
assign a = b & c & d & e;
endmodule

module S6 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c,
				input[2:0]d,
				input[2:0]e );
				
assign a = b & c & d & e;
endmodule



//-- Porta OR

module S7 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c );
				
assign a = b | c;
endmodule

//-- Porta NOR 
module S8 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c );
				
assign a = ~(c|b);
endmodule

//-- Porta AND 
module S9 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c );
				
assign a = c & b;
endmodule

//-- Porta NAND 
module S10 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c );
				
assign a = c & b;
endmodule

//-- Porta XOR
module S11 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c );
				
assign a = b ^ c;
endmodule

//-- Porta XNOR
module S12 ( output[2:0]a,
            input[2:0]b,
            input[2:0]c );
				
assign a = ~(a^b);
endmodule



//-- Porta OR *4 Entradas * SAIDA FINAL
module S13 ( output[2:0]a,
            input[2:0]b,
				input[2:0]c,
            input[2:0]d,
            input[2:0]e,
				input[2:0]f,
				input[2:0]g );
				
assign a = b | c | d | e | f | g;
endmodule



module exec4;


reg	[2:0] a;//-- Entrada A
reg	[2:0] b;//-- Entrada B
reg	[2:0] c;//-- Chave 000/001/010/011/100/101/110
wire	[2:0] d;
wire	[2:0] e;
wire	[2:0] f;
wire	[2:0] g;
wire	[2:0] h;
wire	[2:0] i;
wire	[2:0] j;
wire	[2:0] k;
wire	[2:0] m;
wire	[2:0] n;
wire	[2:0] o;
wire	[2:0] p;


S7 modulo7(d, a, b);//-- OR
S1 modulo(e, d, ~c, ~c, ~c);//-- AND

S8 modulo8(f, a, b);//-- NOR
S2 modulo2(g, f, c, ~c, ~c);//-- AND

S9 modulo9(h, a, b);//-- AND
S3 modulo3(i, h, c, ~c, ~c);//-- AND

S10 modulo10(j, a, b);//-- NAND
S4 modulo4(k, j, c, c, ~c);//-- AND

S11 modulo11(l, a, b);//-- XOR
S5 modulo5(m, l, c, ~c, ~c);//-- AND

S12 modulo12(n, a, b);//-- XNOR
S6 modulo6(o, n, c, c, ~c);//-- AND

S13 modulo13(p, o, m, k, i, g, e);//-- SAIDA

initial begin:start
c=3'b000; a=000; b=000;
end

initial begin 
$display("Miller - 449048"); 
$display("Guia 3 - Exercicio 5");
$display("Chave 000 = Porta OR");
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, p);
#1	a=010; b=011;
#1	a=100; b=101;
#1	a=001; b=101;
#1	a=010; b=100;
#1	a=000; b=011;
#1	a=101; b=001;
#1	a=110; b=110;
#1	a=111; b=101;
#1


$display("");
$display("Chave 01 = Porta NOR");
#2 c=3'b001; a=000; b=000;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, p);
#2	a=010; b=011;
#2	a=100; b=101;
#2	a=001; b=101;
#2	a=010; b=100;
#2	a=000; b=011;
#2	a=101; b=001;
#2	a=110; b=110;
#2	a=111; b=101;
#2

$display("");
$display("Chave 001 = Porta AND");
#3 c=3'b010; a=000; b=000;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, p);
#3	a=010; b=011;
#3	a=100; b=101;
#3	a=001; b=101;
#3	a=010; b=100;
#3	a=000; b=011;
#3	a=101; b=001;
#3	a=110; b=110;
#3	a=111; b=101;
#3

$display("");
$display("Chave 01 = Porta NAND");
#4 c=3'b001; a=000; b=000;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, p);
#4	a=010; b=011;
#4	a=100; b=101;
#4	a=001; b=101;
#4	a=010; b=100;
#4	a=000; b=011;
#4	a=101; b=001;
#4	a=110; b=110;
#4	a=111; b=101;
#4

$display("");
$display("Chave 01 = Porta XOR");
#5 c=3'b001; a=000; b=000;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, p);
#5	a=010; b=011;
#5	a=100; b=101;
#5	a=001; b=101;
#5	a=010; b=100;
#5	a=000; b=011;
#5	a=101; b=001;
#5	a=110; b=110;
#5	a=111; b=101;
#5

$display("");
$display("Chave 01 = Porta XNOR");
#6 c=3'b001; a=000; b=000;
$display("");
$monitor("Entradas %b e %b . Saida = %b ", a, b, p);
#6	a=010; b=011;
#6	a=100; b=101;
#6	a=001; b=101;
#6	a=010; b=100;
#6	a=000; b=011;
#6	a=101; b=001;
#6	a=110; b=110;
#6	a=111; b=101;

end
endmodule

