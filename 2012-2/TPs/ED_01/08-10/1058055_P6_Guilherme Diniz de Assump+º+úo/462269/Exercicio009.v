// -------------------------
// Exercicio009 - and
// Nome: Guilherme Diniz de Assumpcao
// Matricula: 462269
// -------------------------

module andgate (output s, input a, input b);
assign s = a&b;
endmodule

module andgate4(output s, input a, input b,input c,input d);
wire aux,aux2;
andgate a1(aux,a,b);
andgate a2(aux2,c,d);
assign s = aux & aux2;
endmodule

module testeAnd;

wire s;
reg a, b, c, d;

andgate4 A1 (s,a,b,c,d);

initial begin:start

a=0;
b=0;
c=0;
d=0;

end

initial begin:main
$display("Exercicio 002 - Guilherme Diniz de Assumpcao - 462269 ");
$display("Test and:");
$monitor("%d\t%b and %b and %b and %b = %b", $time, a, b,c,d, s);
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