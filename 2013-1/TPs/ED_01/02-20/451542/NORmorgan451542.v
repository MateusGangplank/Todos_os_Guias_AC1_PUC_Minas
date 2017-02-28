//---------------------
// XOR
//---------------------

module xorgate(output s,
input p,
input q);
assign s = ((~p&q)|(p&~q));
endmodule

module testxorgate;

reg a, b;
wire s;
 
xorgate XORGATE1(s, a, b);

initial begin:start
a=0; b=0;

end

initial begin
$display("Bernardo MP Olimpio - 451542"); 
$display("Test xOR MOGAN");
a=0;b=0;
$monitor("%b & %b = %b", a, b, s); 
#1 a=0; b=0; 
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule  
