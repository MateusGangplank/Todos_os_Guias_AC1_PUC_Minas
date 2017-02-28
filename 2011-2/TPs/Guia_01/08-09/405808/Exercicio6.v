// -------------------------
// Exercicio0006 - NOR8
// Nome: José Ferreira Reis Fonseca
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// -- nand8 gate
// ------------------------- 
module nand8gate ( output s, input a, input b, input c, input d, input e, input f, input g, input h, );
assign s = ~(a | b | c | d | e | f | g | h);
endmodule // nand8gate
// --------------------- 
// -- test nand8 gate
// --------------------- 
module testnand8gate;
// ------------------------- dados locais 
reg a, b, c, d, e, f, g, h; // definir registradores
wire s; // definir conexao (fio) 
// ------------------------- instancia 
Nand8gate NAND81 (s, a, b, c, d, e, f, g, h);
// ------------------------- preparacao 
initial begin:setup 
a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercício0006 - José Ferreira Reis Fonseca  - 405808");
$display("Test NOR8 gate");
$display("\n~(a | b | c | d | e | f | g | h) = s\n");
#1 $monitor("%b | %b | %b | %b | %b | %b | %b | %b = %b", a, b, c, d, e, f, g, h, s);
#1
a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
#1
a=0; b=1; c=0; d=0; e=0; f=0; g=0; h=0;
#1
a=0; b=0; c=0; d=1; e=0; f=0; g=0; h=0;
#1
a=0; b=1; c=1; d=0; e=0; f=1; g=0; h=0;
#1
a=0; b=1; c=1; d=0; e=0; f=1; g=1; h=0;
#1
a=0; b=0; c=0; d=1; e=0; f=1; g=0; h=0;
#1
a=0; b=1; c=1; d=0; e=1; f=1; g=0; h=1;
#1
a=0; b=1; c=1; d=1; e=1; f=0; g=1; h=1;
#1
a=1; b=1; c=1; d=1; e=1; f=1; g=1; h=1;
end 
endmodule // testNandgate 