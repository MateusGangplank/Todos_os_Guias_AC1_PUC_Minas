// -------------------------
// Exercicio008 - and
// Nome: Rafael Guimaraes de Sousa
// Matricula: 451607
// -------------------------

module andgate (output s, input a, input b, input c, input d);
assign s = a&b&c&d;
endmodule

module testeAnd;

wire s;
reg a, b, c, d;

andgate A1 (s,a,b,c,d);

initial begin:start

a=0;
b=0;
c=0;
d=0;

end

initial begin:main
$display("Exercicio 008 - Rafael Guimaraes de Sousa - 451607");
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