//...............
//Exemplo0014 - AND
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//..gate
//..............

module and2gate(output saida, input q,w);
assign saida = (q&w);
endmodule
module andgate(output s,input a,b,c);
assign s = ((a&b)&c);
endmodule

//..............teste

module testeandgate;
reg a,b,c;
wire s, s1;

and2gate AND1(s1,a,b);
and2gate AND2(s,s1,c);
initial begin:start
a = 0;
b = 0;
c = 0;
end
initial begin:main
$display("Exemplo0014 - Mateus Lima Batista - 451410");
$display("Test AND gate");
$display("\na&b&c = s\n");
$monitor("%b&%b&%b  = %b",a,b,c,s);
#1 a = 0; b = 0; c = 1;
#1 a = 0; b = 1; c = 0;
#1 a = 0; b = 1; c = 1;
#1 a = 1; b = 0; c = 0;
#1 a = 1; b = 0; c = 1;
#1 a = 1; b = 1; c = 0;
#1 a = 1; b = 1; c = 1;
end
endmodule


