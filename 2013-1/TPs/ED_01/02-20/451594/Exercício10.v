//--------------451594
// OR 3 entradas versao 2
//--------------

module orG2(output s,
input x,
input y);
assign s = x|y;

endmodule

module orG3(output s, input p, input q, input r);
wire s1;

orG2 OR1(s1, p, q);
orG2 OR2(s, r, s1);

endmodule

module testorG3;
reg a,b,c;
wire s;

orG3 OR3(s, a, b, c);
initial begin:start
a=0;
end


initial begin:main
$display("Lucas Ranieri - 451594"); 
$display("Test AND 3 entradas versao 2");
a=0;b=0;c=0;
$monitor("%b & %b & %b = %b", a, b, c, s); 
#1 a=0; b=0; c=0; 
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0; 
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end
endmodule  
