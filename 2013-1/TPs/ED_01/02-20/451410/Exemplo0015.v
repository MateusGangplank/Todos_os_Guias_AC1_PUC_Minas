//...............
//Exemplo0015 - OR
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

module or2gate( output saida, input q,w);
assign saida = q|w;
endmodule

module orgate(output s, input a,b,c);
assign s = ((a|b)|c);
endmodule

//.......... teste

module testeorgate;
reg a,b,c;
wire s,s1;

or2gate OR1(s1,a,b);
or2gate OR2(s,s1,c);

initial begin:start
a = 0;
b = 0;
c = 0;
end
initial begin:main
$display("Exemplo0015 - Mateus Lima Batista - 451410");
$display("Test OR gate");
$display("\na&b&c = s\n");
$monitor("%b|%b|%b  = %b",a,b,c,s);
#1 a = 0; b = 0; c = 1;
#1 a = 0; b = 1; c = 0;
#1 a = 0; b = 1; c = 1;
#1 a = 1; b = 0; c = 0;
#1 a = 1; b = 0; c = 1;
#1 a = 1; b = 1; c = 0;
#1 a = 1; b = 1; c = 1;
end
endmodule
