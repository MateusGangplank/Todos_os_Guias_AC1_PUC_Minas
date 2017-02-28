//--------------451594
// AND 3 entradas
//--------------

module andgate(output s,
input x,
input y,
input z);
assign s = x&y&z;

endmodule

module testandgate;
reg a,b,c;
wire s;

andgate ANDGATE1(s, a, b ,c);

initial begin:start
a=0;b=0;c=0;
end

initial begin
$display(" Lucas Ranieri 451594"); 
$display("Test AND 3 entradas");
a=0;b=0;
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
