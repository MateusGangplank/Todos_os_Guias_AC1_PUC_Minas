//-- Miller - 449048
//-- Arquitetura de Coputadores
//-- Professor Theldo
//-- Guia 03
//-- Exercicio 2

//-- Modulos
module S1 ( output[1:0]m,
            input[1:0]n,
            input[1:0]o );
				
assign m = n | o;
endmodule

module S2 ( output[1:0]r,
            input[1:0]s,
            input[1:0]t );
				
assign r = s & t;
endmodule

module S3 ( output[1:0]d,
            input[1:0]e,
            input[1:0]f );
				
assign d = e & f;
endmodule

module S4 ( output[1:0]g,
            input[1:0]h,
            input[1:0]i );
				
assign g = h & i;
endmodule

module S5 ( output[1:0]a,
            input[1:0]b,
            input[1:0]c );
				
assign a = b | c;
endmodule

//-- Registradores

module exec2;

reg	[1:0] x; 
reg	[1:0] y; 
wire	[1:0] z;
wire	[1:0] w;
wire	[1:0] j;
wire	[1:0] k;
wire	[1:0] l;
reg	[1:0] p; //-- chave(00)

 
S1 modulo1(w, x, y);//-- OR
S2 modulo2(z, x, y);//-- AND

S3 modulo3(j, w, ~p);
S4 modulo4(k, z,p);

S5 modulo5(l, j, k);
 
initial begin:start
p=2'b00; x=00; y=00;
end

initial begin 
$display("Miller - 449048"); 
$display("Guia 3 - Exercicio 2");
$display("Teste: Chave 00 = OR");
$display("");
$monitor(" OR( %b | %b ) = %b", x, y, l);
#1	x=2'b00; y=2'b01;
#1	x=2'b10; y=2'b01;
#1	x=2'b01; y=2'b01;
#1	x=2'b10; y=2'b00;
#1	x=2'b00; y=2'b11;
#1	x=2'b11; y=2'b01;
#1	x=2'b10; y=2'b10;
#1	x=2'b11; y=2'b11;
#1

$display("");
$display("Teste: Chave 11 = AND");
$display("");
#2 p=2'b11; x=00; y=00;
$monitor(" AND( %b & %b ) = %b", x, y, l);

#2	x=2'b00; y=2'b01;
#2	x=2'b10; y=2'b01;
#2	x=2'b01; y=2'b01;
#2	x=2'b10; y=2'b00;
#2	x=2'b00; y=2'b11;
#2	x=2'b11; y=2'b01;
#2	x=2'b10; y=2'b10;
#2	x=2'b11; y=2'b11;


end 
endmodule