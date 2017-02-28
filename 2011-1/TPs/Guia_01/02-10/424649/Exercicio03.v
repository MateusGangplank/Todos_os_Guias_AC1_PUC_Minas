// Giselle Caroline Vieira
// Matricula: 424649

module exercicioxNOR (s,a,b,c,d);

output s;
input a,b,c,d;
assign s = ~(a^b^c^d);

endmodule  //fim exercicio xnor

module testexnor;
reg a,b,c,d;
wire s;

exercicioxNOR xNOR1 (s,a,b,c,d);
initial begin:start
a=0; b=0; c=0; d=0;
end

// parte principal
initial begin:main
$display ("Exercicio 03");
$display ("Teste xNOR");
$display ("~(a^b^c^d) = s\n");

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=0; b=0; c=0; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=0; b=0; c=1; d=0;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=0; b=0; c=1; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=0; b=1; c=0; d=0;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=0; b=1; c=0; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=0; b=1; c=1; d=0;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=0; b=1; c=1; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=1; c=1; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=1; c=1; d=0;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=1; c=0; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=1; c=0; d=0;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=0; c=1; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=0; c=1; d=0;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=0; c=0; d=1;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);
#1 a=1; b=0; c=0; d=0;

#1$display ("%b ^ %b ^ %b ^ %b= %b\n", a,b,c,d,s);

end
endmodule