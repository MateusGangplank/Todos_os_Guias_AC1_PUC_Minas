// -------------------------
// Exercicio004 - nand
// Nome: Guilherme Diniz de Assumpcao
// Matricula: 462269
// -------------------------

module nandgate (output s, input a, input b);
assign s = ~(a)|~(b);
endmodule

module testeNand;

wire s;
reg a, b;

nandgate NA1 (s,a,b);

initial begin:start

a=0;
b=0;

end

initial begin:main
$display("Exercicio 004 - Guilherme Diniz de Assumpcao - 462269 ");
$display("Test nand:");
$monitor("%d\t%b nand %b = %b", $time, a, b, s);
#1 a = 0;b=1;
#1 a=1; b=0;
#2 a = 1;b=1;
end
endmodule  