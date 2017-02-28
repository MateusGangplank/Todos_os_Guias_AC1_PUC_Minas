// Giselle Caroline Vieira
// Matricula: 424649

module exercicioNAND (s,a,b,c);

output s;
input a,b,c;
assign s = ~(a&b&c);

endmodule  //exercicio nand

module testnand;
reg a,b,c;
wire s;

exercicioNAND NAND1 (s,a,b,c);
initial begin:start
a=0; b=0; c=0;
end
// parte principal
initial begin:main
$display ("Exercicio 01");
$display ("Teste NAND");
$display ("~(a&b&c) = s\n");

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
#1 a=0; b=0; c=1;

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
#1 a=0; b=1; c=0;

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
#1 a=0; b=1; c=1;

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
#1 a=1; b=1; c=1;

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
#1 a=1; b=0; c=0;

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
#1 a=1; b=0; c=1;

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
#1 a=1; b=1; c=0;

#1$display ("%b & %b & %b= %b\n", a,b,c,s);
end
endmodule