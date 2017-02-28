// --------------------------------------------- 
// Exemplo0031 
// Nome: Miller 
// Matricula: 449048 
// ---------------------------------------------
// Exercicio 1 - Somador/Subtrador Selecionavel
// ---------------------------------------------

module fullAdder (output s0, output carryOut, 
                  input x,input y, input carryIn);
						
assign s0 = (x^y)^carryIn;
assign carryOut = (((x^y)&carryIn)|(x&y));

endmodule

module subtrador (output s0, output carryOut, 
                  input x,input y, input carryIn);
						
assign s0 = x^y;
assign carryOut = ((~x|y)&carryIn)|(~x&y);

endmodule

module unir5b(output [4:0] s, input a, input b, input c, input d, input e);
assign s[0] = a;
assign s[1] = b;
assign s[2] = c;
assign s[3] = d;
assign s[4] = e;

endmodule

module seletor5b (output[4:0] s, input[4:0] a, input[4:0] b, input c);
assign s[4] = (a[0]&c)|(b[0]&~c);
assign s[3] = (a[1]&c)|(b[1]&~c);
assign s[2] = (a[2]&c)|(b[2]&~c);
assign s[1] = (a[3]&c)|(b[3]&~c);
assign s[0] = (a[4]&c)|(b[4]&~c);

endmodule

module Main;

reg [3:0]a, b;
reg c, ci;
wire s0, s1, s2, s3, r0, r1, r2, r3;
wire co0, co1, co2, co3, v0, v1, v2, v3;
wire[4:0] j1, j2, j3;

fullAdder A(s0, co0, a[0], b[0], ci);
fullAdder B(s1, co1, a[1], b[1], co0);
fullAdder C(s2, co2, a[2], b[2], co1);
fullAdder D(s3, co3, a[3], b[3], co2);

subtrador A2(r0, v0, a[0], b[0], ci);
subtrador B2(r1, v1, a[1], b[1], v0);
subtrador C2(r2, v2, a[2], b[2], v1);
subtrador D2(r3, v3, a[3], b[3], v2);

unir5b X(j1, co3, s3, s2, s1, s0);
unir5b Y(j2, v3, r3, r2, r1, r0);
seletor5b Z(j3, j2, j1, c); 

initial begin:start 
a=4'b0000; b=4'b0000;
ci=1'b0; c=1'b0;
end

initial begin
$display("Exemplo0031 - Miller - 449048"); 
$display("Somador/Subtrador selecionavel");
$display("");
$monitor("%b + %b = %b", a, b, j3 );

#1	a=4'b0101;	b=4'b1001; 
#1	a=4'b1100;	b=4'b0111;
#1	a=4'b0010;	b=4'b1000;
#1	a=4'b1010;	b=4'b1000;
#1	a=4'b0110;	b=4'b0000;
#1	a=4'b0010;	b=4'b1111;
#1	a=4'b1111;	b=4'b1111;
#1	a=4'b0000;	b=4'b1111;
#1	a=4'b0001;	b=4'b1111;

#2 a=4'b0000;	b=4'b0000; c=1'b1;
$display("");
$monitor("%b - %b = %b", a, b, j3 );

#2	a=4'b0101;	b=4'b1001; 
#2	a=4'b1100;	b=4'b0111;
#2	a=4'b0010;	b=4'b1000;
#2	a=4'b1010;	b=4'b1000;
#2	a=4'b0110;	b=4'b0000;
#2	a=4'b0010;	b=4'b1111;
#2	a=4'b1111;	b=4'b1111;
#2	a=4'b0000;	b=4'b1111;
#2	a=4'b0001;	b=4'b1111;

end
endmodule
