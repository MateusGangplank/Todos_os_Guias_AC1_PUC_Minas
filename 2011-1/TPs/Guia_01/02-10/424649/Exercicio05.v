// Giselle caroline Vieira
// Matricula; 424649

module exercicioXOR1 (s,a,b);

output s;
input a,b;

assign s = ~(a^b);
endmodule // fim XOR

module testexor;
reg a,b;
wire s;

exercicioXOR1 XOR2 (s,a,b);
initial begin:start

a=0;b=0;
end

initial begin:main
$display ("Exercicio 04");
$display ("Teste XOR1");
$display ("(~a^b)|(a^~b) = s\n");


#1$display ("%b ^ %b | %b ^ %b = %b\n", ~a,b,a,~b,s);
#1 a=0; b=1; 

#1$display ("%b ^ %b | %b ^ %b = %b\n", ~a,b,a,~b,s);
#1 a=1; b=0; 

#1$display ("%b ^ %b | %b ^ %b = %b\n", ~a,b,a,~b,s);
#1 a=1; b=1; 

#1$display ("%b ^ %b | %b ^ %b = %b\n", ~a,b,a,~b,s);
end
endmodule