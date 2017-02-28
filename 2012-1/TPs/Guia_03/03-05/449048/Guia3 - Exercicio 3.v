//-- Miller - 449048
//-- Arquitetura de Coputadores
//-- Professor Theldo
//-- Guia 03
//-- Exercicio 3

//-- Modulos
module S1 ( output[1:0]a,
            input[1:0]b,
            input[1:0]c );
				
assign a = b & c;
endmodule

module S2 ( output[1:0]d,
            input[1:0]e,
            input[1:0]f );
				
assign d = e & f;
endmodule

module S3 ( output[1:0]g,
            input[1:0]h,
            input[1:0]i );
				
assign g = h & i;
endmodule

module S4 ( output[1:0]j,
            input[1:0]k,
            input[1:0]l );
				
assign j = k & l;
endmodule

module S5 ( output[1:0]m,
            input[1:0]n,
            input[1:0]o );
				
assign m = n & o;
endmodule

module S6 ( output[1:0]p,
            input[1:0]q,
            input[1:0]r );
				
assign p = q | r;
endmodule

module S7 ( output[1:0]s,
            input[1:0]t,
            input[1:0]u );
				
assign s = t | u;
endmodule

module S8 ( output[1:0]s,
            input[1:0]t,
            input[1:0]u );
				
assign s = t & u;
endmodule



module exec3;

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

S7 modulo7(d, a, b);//-- OR
S1 modulo1(e, a, b);//-- AND

S2 modulo2(f, ~d, c);//-- AND
S3 modulo3(g, ~e, c);//-- AND


S4 modulo4(h, a, b);//-- AND
S5 modulo5(i, h, ~c);//-- AND

S6 modulo6(j, a, b);//-- OR
S8 modulo8(k, j, ~c);//-- AND

initial begin:start
c=2'b11; a=00; b=00;
end

initial begin 
$display("Miller - 449048"); 
$display("Guia 3 - Exercicio 3");
$display("Teste: Chave 11 = Grupo NOR e NAND");
$display("");
$monitor(" Entradas( %b | %b ) = NAND = %b , NOR = %b", a, b, f, g );

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
$display("Teste: Chave 00 = Grupo OR e AND");
$display("");
#2	c=2'b00; a=00; b=00;
$monitor(" Entradas( %b | %b ) = AND = %b , OR = %b", a, b, i, k );

#2	a=2'b00; b=2'b01;
#2	a=2'b10; b=2'b01;
#2	a=2'b01; b=2'b01;
#2	a=2'b10; b=2'b00;
#2	a=2'b00; b=2'b11;
#2	a=2'b11; b=2'b01;
#2	a=2'b10; b=2'b10;
#2	a=2'b11; b=2'b11;

end
endmodule