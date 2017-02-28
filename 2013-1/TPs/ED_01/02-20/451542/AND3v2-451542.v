//--------------
// AND 3 entradas versao 2
//--------------

module andG2(output s,
input x,
input y);
assign s = x&y;

endmodule

module andG3(output s, input p, input q, input r);
wire s1;

andG2 AND1(s1, p, q);
andG2 AND2(s, r, s1);

endmodule

module testandG3;
reg a,b,c;
wire s;

andG3 AND3(s, a, b, c);
initial begin:start
a=0;
end


initial begin:main
$display("Bernardo MP Olimpio - 451542"); 
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
