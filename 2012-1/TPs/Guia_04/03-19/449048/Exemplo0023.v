// ------------------------- 
// Exemplo0023 – Comparador de Igualdade
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
// Exercicio 3
// ------------------------- 
//  Comparador de Igualdade
// -------------------------

module cmpIguais(output s, input[3:0] a, input[3:0] b);
assign s = ( ~(a[0]^b[0])&~(a[1]^b[1])&~(a[2]^b[2])&~(a[3]^b[3]) );

endmodule

module variaveis;

reg[3:0] a,b;
wire s;

cmpIguais Main(s, a, b);

initial begin:start
a=4'b0000; b=4'b1111;
end

initial begin

$display("Miller 449048");
$display("Teste de comparador de igualdades.");
$display("");
$monitor("%b e %b sao iguais? (%b)", a, b, s);

#1 a=4'b0000; b=4'b1111;
#1 a=4'b0011; b=4'b1111;
#1 a=4'b1000; b=4'b1111;
#1 a=4'b0110; b=4'b0011;
#1 a=4'b0100; b=4'b0100;
#1 a=4'b0000; b=4'b0000;

end
endmodule