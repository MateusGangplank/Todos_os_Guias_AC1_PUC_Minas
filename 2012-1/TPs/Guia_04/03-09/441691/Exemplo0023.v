// ------------------------- 
// Exemplo0023 - igual 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// igual_gate 
// ------------------------- 
module igual (output  s,
input  [3:0] a, 
input  [3:0] b);

wire [3:0] x;

xnor XNOR1(x[0],a[0],b[0]);
xnor XNOR2(x[1],a[1],b[1]);
xnor XNOR3(x[2],a[2],b[2]);
xnor XNOR4(x[3],a[3],b[3]);
and AND1(s,x[0],x[1],x[2],x[3]);

endmodule//igual

module test_igual; 
// ------------------------- definir dados 
reg [3:0] y,z;  
wire g;
igual modulo1 (g,y,z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0023 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
y = 4'b0000; z = 4'b0000;
// projetar testes do modulo 
#1 $monitor("%3b %3b = %3b ",y,z,g);
#1 y = 4'b0001; z = 4'b0000;
#1 y = 4'b0001; z = 4'b0001;
#1 y = 4'b0010; z = 4'b0001;
#1 y = 4'b0010; z = 4'b0010;
#1 y = 4'b0011; z = 4'b0010;
#1 y = 4'b0011; z = 4'b0011;
#1 y = 4'b0100; z = 4'b0011;
#1 y = 4'b0100; z = 4'b0100;
#1 y = 4'b0101; z = 4'b0100;
#1 y = 4'b0101; z = 4'b0101;
#1 y = 4'b0110; z = 4'b0101;
#1 y = 4'b0110; z = 4'b0110;
#1 y = 4'b0111; z = 4'b0110;
#1 y = 4'b0111; z = 4'b0111;
#1 y = 4'b1000; z = 4'b0111;
#1 y = 4'b1000; z = 4'b1000;
#1 y = 4'b1001; z = 4'b1000;
#1 y = 4'b1001; z = 4'b1001;
#1 y = 4'b1010; z = 4'b1001;
#1 y = 4'b1010; z = 4'b1010;
#1 y = 4'b1011; z = 4'b1010;
#1 y = 4'b1011; z = 4'b1011;
#1 y = 4'b1100; z = 4'b1011;
#1 y = 4'b1100; z = 4'b1100;
#1 y = 4'b1101; z = 4'b1100;
#1 y = 4'b1101; z = 4'b1101;
#1 y = 4'b1110; z = 4'b1101;
#1 y = 4'b1110; z = 4'b1110;
#1 y = 4'b1111; z = 4'b1110;
#1 y = 4'b1111; z = 4'b1111;

end 
endmodule // test_igual 