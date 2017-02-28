//--------------------
// Exercicio0002 - NOR
// Nome: Felipe Barros
// Matricula: 376508
// -------------------

module norgate ( s, p, q);

output s;
input p, q;

assign s = ~(p | q);

endmodule

//-- teste NOR

module testnorgate;
reg a, b; // entrada
wire s; //saida

//----
norgate NOR1 (s, a, b);

initial begin: start
a = 0; b=0;
end

//-- parte principal
initial begin

$display ("test norgate");
$display ("\na  b = s\n");
$monitor (" %b  %b  %b", a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end

endmodule





