// Nome: 
// Matricula:
module orgate1 (output s , input p , input q);
assign s = p + q;
endmodule

module orgate2 (output s2 ,input p, input q, input r);
orgate1 blabla (s,p,q);
assign s2 = s + r;
endmodule

module testeorgate;
reg a,b,c;
wire s;

orgate2 and1 (s,a,b,c);
initial begin 
a=0;
b=0;
c=0;
end

initial begin
$display("blabla");
$monitor("%b | %b | %b = %b",a,b,c,s);
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end 

endmodule