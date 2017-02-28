// ------------------------- 
// NAND 
// Lucas Ranieri
// ------------------------- 
module nandgate ( output s, 
input p, 
input q); 
assign s = ~(p & q); 
endmodule 

module testnandgate; 

reg a, b; 
wire s; 

nandgate NAND1 (s, a, b); 

initial begin:start 
a=0; b=0; 
end 

initial begin 
$display("Lucas Ranieri  - 451594"); 
$display("Test NAND gate"); 
$display("\na & b = s\n"); 
a=0; b=0; 
#1 $display("%b & %b = %b", a, b, s); 
a=0; b=1; 
#1 $display("%b & %b = %b", a, b, s); 
a=1; b=0; 
#1 $display("%b & %b = %b", a, b, s); 
a=1; b=1; 
#1 $display("%b & %b = %b", a, b, s); 
end 
endmodule // testnandgate