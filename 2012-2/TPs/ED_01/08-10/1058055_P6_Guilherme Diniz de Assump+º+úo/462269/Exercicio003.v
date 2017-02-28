// -------------------------
// Exercicio003 - xnor
// Nome: Guilherme Diniz de Assumpcao
// Matricula: 462269
// -------------------------

module xnorgate (output s, input a, input b);
assign s = ~(a^b);
endmodule

module testeXnor;

wire s;
reg a, b;

xnorgate XNO1 (s,a,b);

initial begin:start

a=0;
b=0;

end

initial begin:main
$display("Exercicio 003 - Guilherme Diniz de Assumpcao - 462269 ");
$display("Test xnor:");
$monitor("%d\t%b xnor %b = %b", $time, a, b, s);
#1 a = 0;b=1;
#1 a=1; b=0;
#2 a = 1;b=1;
end
endmodule  