// -------------------------
// Exercicio010 - or
// Nome: Guilherme Diniz de Assumpcao
// Matricula: 462269
// -------------------------

module orgate (output s, input a, input b);
assign s = a|b;
endmodule

module orgate4(output s, input a, input b,input c,input d);
wire aux,aux2;
orgate a1(aux,a,b);
orgate a2(aux2,c,d);
assign s = aux | aux2;
endmodule

module testeOr;

wire s;
reg a, b, c, d;

orgate4 O1 (s,a,b,c,d);

initial begin:start

a=0;
b=0;
c=0;
d=0;

end

initial begin:main
$display("Exercicio 010 - Guilherme Diniz de Assumpcao - 462269 ");
$display("Test or:");
$monitor("%d\t%b or %b or %b or %b = %b", $time, a, b,c,d, s);
#1 a=0;b=0;c=0;d=1;
#1 a=0;b=0;c=1;d=0;
#1 a=0;b=0;c=1;d=1;
#1 a=0;b=1;c=0;d=0;
#1 a=0;b=1;c=0;d=1;
#1 a=0;b=1;c=1;d=0;
#1 a=0;b=1;c=1;d=1;
#1 a=1;b=0;c=0;d=0;
#1 a=1;b=0;c=0;d=1;
#1 a=1;b=0;c=1;d=0;
#1 a=1;b=0;c=1;d=1;
#1 a=1;b=1;c=0;d=0;
#1 a=1;b=1;c=0;d=1;
#1 a=1;b=1;c=1;d=0;
#1 a=1;b=1;c=1;d=1;
end
endmodule