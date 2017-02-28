//Lucas Ranieri
//451594
//
//
//

module f4(output [3:0] s,output [3:0] h, input [3:0] a, input [3:0] b);
assign s = a & b;
assign h = a | b;
 
endmodule

module teste_f4;
reg[3:0] x;
reg[3:0] y;
wire[3:0] z;
wire[3:0] w;
 
f4 modulo (z, w, x, y);
 
initial begin
$display("Exemplo0031 - Lucas Ranieri Oliveira Alves - 451594");
$display("test LU's module");
  
x = 4'b0011;
y = 4'b1001;
  
#1
$display("Andgate: %3b & %3b = %3b", x, y, z);
#1
$display(" Orgate: %3b | %3b = %3b", x, y, w);
  
end
 
endmodule
