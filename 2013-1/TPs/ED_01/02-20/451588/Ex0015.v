//-------------
//Exemplo0015//OR
//Nome:Leonardo Machado Decina
//Matricula:451588
//-------------
//-------------
//--orgate
//-------------
module orgate (output s, input p, input q);
assign s = (p | q);
endmodule // orgate
module orgate2 (output s, input p, input q, input r);
wire s1;
orgate OR1 (s1, p, q);
orgate OR2 (s, r, s1);
endmodule//endgate
module testorgate;
reg a,b,c;
wire s;
orgate2 OR3(s,a,b,c);
//---------parte principal
initial begin:start
a=0;b=0;c=0;
end

initial begin:main
$display("Exemplo0015 - Leonardo Machado Decina 451588");
$display("test orgate");
$display("a | b | c = s");

#1 a=0;b=0;c=0;
$monitor("%b | %b | %b = %b",a,b,c,s);
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end
endmodule//testorgate