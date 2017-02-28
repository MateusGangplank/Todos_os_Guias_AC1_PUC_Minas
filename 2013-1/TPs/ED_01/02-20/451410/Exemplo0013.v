//...............
//Exemplo0013 - AND
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//..gate
//...............

module andgate(output s, input a,b,c);
assign s = (a&b&c);
endmodule

//..........teste

module testeandgate;
reg a,b,c;
wire s;

andgate AND1(s,a,b,c);

initial begin : start
a = 0; b = 0; c = 0;
end

initial begin : main
$display("Exemplo0013 - Mateus Lima Batista - 451410");
$display("Test AND gate");
$display("\n(a&b&c) = s");
$monitor("\n(%b&%b&%b) = %b",a,b,c,s);
#1 a = 0; b = 0; c = 1;
#1 a = 0; b = 1; c = 0;
#1 a = 0; b = 1; c = 1;
#1 a = 1; b = 0; c = 0;
#1 a = 1; b = 0; c = 1;
#1 a = 1; b = 1; c = 0;
#1 a = 1; b = 1; c = 1;
end
endmodule