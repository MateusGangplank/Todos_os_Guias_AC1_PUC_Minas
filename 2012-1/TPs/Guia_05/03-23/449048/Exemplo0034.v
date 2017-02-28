// --------------------------------------------- 
// Exemplo0034 
// Nome: Miller 
// Matricula: 449048 
// ---------------------------------------------
// Exercicio 4 - Decremento de 1
// ---------------------------------------------

module subtrador (output s0, output carryOut, 
                  input x,input y, input carryIn);
						
assign s0 = x^y;
assign carryOut = ((~x|y)&carryIn)|(~x&y);

endmodule

module unir(output[4:0] s, input a, input b, input c, input d, input e);
assign s[0] = e;
assign s[1] = d;
assign s[2] = c;
assign s[3] = b;
assign s[4] = a;

endmodule

module Main;

reg [3:0]a, b;
reg ci;
wire s0, s1, s2, s3;
wire co0, co1, co2, co3;
wire[4:0] Sf;

subtrador A(s0, co0, a[0], b[0], ci);
subtrador B(s1, co1, a[1], b[1], co0);
subtrador C(s2, co2, a[2], b[2], co1);
subtrador D(s3, co3, a[3], b[3], co2);

unir T(Sf, co3, s3, s2, s1, s0);

initial begin:start 
a=4'b0000; b=4'b0001;
ci=1'b0;
end

initial begin
$display("Exemplo0034 - Miller - 449048"); 
$display("Decremento de 1");
$display("");
$monitor("%b = %b", a, Sf );

#1	a=4'b0101;
#1	a=4'b1100;
#1	a=4'b0010;
#1	a=4'b1010;
#1	a=4'b0110;
#1	a=4'b0010;
#1	a=4'b1111;
#1	a=4'b0000;
#1	a=4'b0001;

end
endmodule
