// -------------------------
// Exercicio005 - nor
// Nome: Rafael Guimaraes de Sousa
// Matricula: 451607
// -------------------------

module norgate (output s, input a, input b);
assign s = ~(a)&~(b);
endmodule

module testeNor;

wire s;
reg a, b;

norgate NO1 (s,a,b);

initial begin:start

a=0;
b=0;

end

initial begin:main
$display("Exercicio 005 - Rafael Guimaraes de Sousa - 451607");
$display("Test nor:");
$monitor("%d\t%b nor %b = %b", $time, a, b, s);
#1 a = 0;b=1;
#1 a=1; b=0;
#2 a = 1;b=1;
end
endmodule  