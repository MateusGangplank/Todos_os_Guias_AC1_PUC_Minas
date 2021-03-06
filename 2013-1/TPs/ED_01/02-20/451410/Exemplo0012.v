//...............
//Exemplo0012 - XNOR
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//..gate
//...............

module xnorgate(output s, input a,b);
assign s = (a&b)+(~a&~b);
endmodule

//...........teste

module testexnorgate;
reg a,b;
wire s;

xnorgate XNOR1(s,a,b);
initial begin:start
a = 0;
b = 0;
end

initial begin:main
$display("Exemplo0012 - Mateus Lima Batista - 451410");
$display("Test XNOR gate");
$display("\na'b+ab' = s\n");
$monitor("%b&%b + (~%b&~%b) = %b",a,b,a,b,s);
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;
end
endmodule
