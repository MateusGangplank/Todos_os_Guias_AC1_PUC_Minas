//...............
//Exemplo0011 - XOR
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//..gate
//...............
module xorgate (output s, input a,b);
assign s = (~a&b)+(a&~b);
endmodule
//...........teste
module testexorgate;
reg a,b;
wire s;

xorgate XOR1(s,a,b);
initial begin:start
a = 0; 
b = 0;
end

initial begin:main
$display("Exemplo0011 - Mateus Lima Batista - 451410");
$display("Test XOR gate");
$display("\na'b+ab' = s\n");
$monitor ("\n((~%b)(%b)+ (%b)(~%b)) = %b" , a,b,a,b,s);
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;
end
endmodule
