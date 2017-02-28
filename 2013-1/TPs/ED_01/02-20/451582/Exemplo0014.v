//-------------
//Exemplo0014//AND
//Nome:Joao Augusto de Moura Araujo
//Matricula:451582
//-------------
//-------------
//--andgate
//-------------
module andgate (output s, input p, input q);
assign s = (p & q);
endmodule // andgate
module andgate2 (output s, input p, input q, input r);
wire s1;
andgate AND1 (s1, p, q);
andgate AND2 (s, r, s1);
endmodule//endgate
module testandgate;
reg a,b,c;
wire s;
andgate2 AND3(s,a,b,c);
//---------parte principal
initial begin:start
a=0;b=0;c=0;
end

initial begin:main
$display("Exemplo0014 - Joao Augusto de Moura Araujo - 451582");
$display("test andgate");
$display("a & b & c = s");

#1 a=0;b=0;c=0;
$monitor("%b & %b & %b = %b",a,b,c,s);
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end
endmodule//testandgate