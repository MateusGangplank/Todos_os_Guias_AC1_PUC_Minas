//---------------------451594
// XNOR
//---------------------

module xnorgate(output s,input p,input q);
assign s = ((p&q)|(~p&~q));
endmodule

module testxnorgate;

reg a, b;
wire s;
 
xnorgate XNORGATE1(s, a, b);

initial begin:start
a=0; b=0;

end

initial begin
$display("Lucas Ranieri"); 
$display("Test xNOR MOGAN");
a=0;b=0;
$monitor("%b & %b = %b", a, b, s); 
#1 a=0; b=0; 
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule  
