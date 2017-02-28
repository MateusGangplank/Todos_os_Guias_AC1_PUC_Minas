// -------------------------
// Exercicio006 - xor
// Nome: Rafael Guimaraes de Sousa
// Matricula: 451607
// -------------------------

module xorgate (output s, input a, input b);
assign s = (~(a)&(b)) | ((a)&~(b));
endmodule

module testeXor;

wire s;
reg a, b;

xorgate XNO1 (s,a,b);

initial begin:start

a=0;
b=0;

end

initial begin:main
$display("Exercicio 006 - Rafael Guimaraes de Sousa - 451607");
$display("Test xor:");
$monitor("%d\t%b xor %b = %b", $time, a, b, s);
#1 a = 0;b=1;
#1 a=1; b=0;
#2 a = 1;b=1;
end
endmodule  