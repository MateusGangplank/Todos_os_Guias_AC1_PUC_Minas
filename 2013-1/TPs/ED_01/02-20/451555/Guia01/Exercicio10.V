//-------------
//Exercicio10//OR
//Nome:Filipe Santos
//Matricula:451555
//-------------
//-------------
//--orgate
//-------------
module orgate (output s, input p, input q);
assign s = (p | q);
endmodule // andgate
module orgate2 (output s, input p, input q, input r);
wire s1;
orgate OR1 (s1, p, q);
orgate OR2 (s, r, s1);
endmodule//endgate
module testandgate2;
reg a,b,c;
wire s;
orgate2 OR3(s,c,a,b);
//---------parte principal
initial begin:start
a=0;b=0;c=0;
end
initial begin:main
$display("Exercicio08-Filipe Santos-451555");
$display("test andgate");
$display("a.b.c=s");
$monitor("%b|%b|%b=%b",a,b,c,s);
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end
endmodule//testandgate