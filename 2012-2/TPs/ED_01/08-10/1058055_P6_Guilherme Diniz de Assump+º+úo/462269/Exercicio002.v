// -------------------------
// Exercicio002 - nor
// Nome: Guilherme Diniz de Assumpcao
// Matricula: 462269
// -------------------------

module norgate (output s, input a, input b);
assign s = ~(a|b);
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
$display("Exercicio 002 - Guilherme Diniz de Assumpcao  462269 ");
$display("Test nor:");
$monitor("%d\t%b nor %b = %b", $time, a, b, s);
#1 a = 0;b=1;
#1 a=1; b=0;
#2 a = 1;b=1;
end
endmodule  