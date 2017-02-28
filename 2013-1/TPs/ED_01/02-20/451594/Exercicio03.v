// ------------------------- 
// xNOR 
// Lucas Ranieri 
module xnorgate ( output s, 
input p, 
input q); 
assign s = ~(p^q); 
endmodule 

module testxnorgate; 

reg a, b;  
wire s; 

xnorgate XNOR1 (s, a, b); 

initial begin:start 
a=0; b=0; 

end 

initial begin 
$display("Lucas Ranieri 451594"); 
$display("Test XNOR gate"); 
$display("\na | b = s\n"); 
a=0; b=0; 
$monitor("~(%b ^ %b) = %b", a, b, s); 
#1 a=0; b=0; 
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end
endmodule 