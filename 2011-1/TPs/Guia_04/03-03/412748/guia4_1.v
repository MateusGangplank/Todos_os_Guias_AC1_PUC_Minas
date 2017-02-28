// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 04_1
// -- Nome: Jessica Luisa Betonico Andradde	Matricula: 412748
module HalfAdder (s0,s1,a,b);
input a,b;
output s0,s1;
wire q0,q1,q2,q3,q4;
nor nor1 (q0,a,a);
nor nor2 (q1,b,b);
nor nor3 (q2,q0,b);
nor nor4 (q3,q1,a); 
nor nor5 (q4,q3,q2);
nor nor6 (s1,q4,q4);
nor nor7 (s0,q0,q1); 
endmodule

module Teste_soma;
reg a,b;
wire s0,s1;
HalfAdder HA (s0,s1,a,b);
initial begin: start
a=0; b=0;
end

initial begin:main
$display ("Nome: Jessica Luisa Betonico Andradde	Matricula: 412748");
$display ("Operador de Meia-Soma ");
$display (" a | b | = | s0 | s1 |\n");
$monitor (" %b | %b | = | %2b | %2b |",a,b,s0,s1);
#1	a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1; 
end
endmodule

// OBS.: FALTOU SIMULAR NO LOGISIM.

