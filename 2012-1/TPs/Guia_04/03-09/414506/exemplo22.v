
 // ------------------------- 
// Exemplo0022 - subtractor 
// Nome: Fernando Silva  
// Matricula: 414506 
// ------------------------- 
// ------------------------- 
// subtractor
// ------------------------- 
module subtractor(output [16:0]s, input [3:0]a, input [3:0]b, input carryIn); 


xor X1(s[0],a[0],b[0]);
xor X2(s[1],a[1],b[1]);
xor X3(s[2],a[2],b[2]);
xor X4(s[3],a[3],b[3]);

and A1(s[7],~a[0],b[0]);
and A2(s[6],~a[1],b[1]);
and A3(s[5],~a[2],b[2]);
and A4(s[4],~a[3],b[3]);

xor X4(s[11],s[0],carryIn);
xor X5(s[10],s[1],carryIn);
xor X6(s[9],s[2],carryIn);
xor X7(s[8],s[3],carryIn);

and A5(s[15],~s[0],carryIn);
and A6(s[14],~s[1],carryIn);
and A7(s[13],~s[2],carryIn);
and A8(s[12],~s[3],carryIn);

xor  O1(s[16],s[7],s[6],s[5],s[4],s[15],s[14],s[13],s[12]);


endmodule // subtractor 
module test_subtractor; 
// ------------------------- definir dados 
reg [3:0]x; 
reg  [3:0]y; 
reg carry; 
wire [16:0] soma; 


subtractor Sub(soma,x,y,carry);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0022 - Fernando Silva - 414506"); 
$display("Test ALU's full adder"); 
$display("x  -  y  = sinal resultado");
#1 x=4'b0000; y=4'b0000; carry=1'b0;
$monitor("%3b - %3b = %1b ", x,y,soma[8],soma[9],soma[10],soma[11]);    //soma[11:8]>>carry out,soma[16]>>saida
#1 x=4'b1010; y=4'b1101; carry=1'b0;
#1 x=4'b0111; y=4'b0011; carry=1'b0;
#1 x=4'b0100; y=4'b1011; carry=1'b0;


// projetar testes do somador complete 
end 
endmodule // test_subtractor 