
 // ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Fernando Silva 
// Matricula: 414506 
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
module fullAdder (output [15:0]s, input [0:2]a, input [0:2]b, input carryIn); 


xor XOR1(s[0],a[2],b[2]);
and AND1(s[1],a[2],b[2]);
xor XOR2(s[2],s[0],carryIn);
and AND2(s[3],s[0],carryIn);
or  OR1(s[4],s[1],s[3]);

xor XOR1(s[5],a[1],b[1]);
and AND1(s[6],a[1],b[1]);
xor XOR2(s[7],s[5],s[4]);
and AND2(s[8],s[5],s[4]);
or  OR1(s[9],s[6],s[8]);

xor XOR1(s[10],a[0],b[0]);
and AND1(s[11],a[0],b[0]);
xor XOR2(s[12],s[10],s[9]);
and AND2(s[13],s[10],s[9]);
or  OR1(s[14],s[11],s[13]);



endmodule // fullAdder 
module test_fullAdder; 
// ------------------------- definir dados 
reg [2:0]x; 
reg  [2:0]y; 
reg carry; 
wire [15:0] soma; 


fullAdder full(soma,x,y,carry);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Fernando Silva - 414506"); 
$display("Test ALU's full adder"); 
$display("x  +  y  = carry_on resultado");
#1 x=3'b001; y=3'b001; carry=1'b0;
$monitor("%3b + %3b = %1b %1b  %1b   ", x,y,soma[14],soma[12],soma[7],soma[2]);    
#1 x=3'b101; y=3'b011; carry=1'b0;
#1 x=3'b000; y=3'b101; carry=1'b0;
#1 x=3'b101; y=3'b100; carry=1'b0;


// projetar testes do somador complete 
end 
endmodule // test_fullAdder 