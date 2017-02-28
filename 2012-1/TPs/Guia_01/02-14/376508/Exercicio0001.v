// -----------------------
// Exercicio0001 - NAND
// Nome: Felipe Barros Silva
// Matricula: 376508
// -----------------------

// -- nand gate

module nandgate (output s, input p, input q);

assign s = ~(p & q);
endmodule

//-------------------

// teste de module

module testnandgate;

reg a, b; //entrada
wire s; //saida

nandgate NAND1 (s, a, b);

//começa executar
initial begin: start
a=0; b=0;
end

//-- parte principal --
initial begin

$display ("teste NAND gate");
$display ("\na   b = s\n");
a=0; b=0;
#1 $display ("%b   %b = %b", a, b, s);
a=1; b=0;
 #1$display ("%b   %b = %b", a, b, s);
a=0; b=1;
#1$display ("%b   %b = %b", a, b, s);
a=1; b=1;
#1$display ("%b   %b = %b", a, b, s);
end // fim de teste

endmodule

