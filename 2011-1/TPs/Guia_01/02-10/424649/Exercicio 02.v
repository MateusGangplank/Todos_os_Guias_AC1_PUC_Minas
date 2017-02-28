// Giselle caroline Vieira
// Matricula; 424649

module exercicioNOR (s,a,b,c);

output s;
input a,b,c;

assign s = ~(a|b|c);
endmodule // fim NOR

module testenor;
reg a,b,c;
wire s;

exercicioNOR NOR1 (s,a,b,c);
initial begin:start

a=0;b=0;c=0;
end

initial begin:main
$display ("Exercicio 02");
$display ("Teste NOR");
$display ("~(a|b|c) = s\n");

#1$display ("%b | %b | %b= %b\n", a,b,c,s);
#1 a=0; b=0; c=1;

#1$display ("%b | %b | %b= %b\n", a,b,c,s);
#1 a=0; b=1; c=0;

#1$display ("%b | %b | %b= %b\n", a,b,c,s);
#1 a=0; b=1; c=1;

#1$display ("%b | %b | %b= %b\n", a,b,c,s);
#1 a=1; b=1; c=1;

#1$display ("%b | %b | %b= %b\n", a,b,c,s);
#1 a=1; b=0; c=0;

#1$display ("%b | %b | %b= %b\n", a,b,c,s);
#1 a=1; b=0; c=1;

#1$display ("%b | %b | %b= %b\n", a,b,c,s);
#1 a=1; b=1; c=0;

#1$display ("%b | %b | %b= %b\n", a,b,c,s);

end
endmodule