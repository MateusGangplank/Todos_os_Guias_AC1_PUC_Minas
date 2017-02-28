// ------------------------- 
// Exemplo0021 – Subtrador Completo
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
// Exercicio 2
// ------------------------- 
//  Subtrador Completo
// -------------------------

module subtrador (output s0, output carryOut, 
                  input x,input y, input carryIn);
						
assign s0 = x^y;
assign carryOut = ((~x|y)&carryIn)|(~x&y);

endmodule

module Registros;

reg [3:0]a, b;
reg ci;
wire s0, s1, s2, s3;
wire co0, co1, co2, co3;

subtrador A(s0, co0, a[0], b[0], ci);
subtrador B(s1, co1, a[1], b[1], co0);
subtrador C(s2, co2, a[2], b[2], co1);
subtrador D(s3, co3, a[3], b[3], co2);

initial begin:start 
a=4'b0000; b=4'b0000;
ci=1'b0; 
end

initial begin 
$display("Exemplo0021 - Miller - 449048"); 
$display("Test Subtrador:");
$display("");
$monitor("%b - %b = (%b)%b%b%b%b", a, b, co3, s3, s2, s1, s0);
#1	a=4'b0101;	b=4'b1001; 
#1	a=4'b1100;	b=4'b0111;
#1	a=4'b0010;	b=4'b1000;
#1	a=4'b1010;	b=4'b1000;
#1	a=4'b0110;	b=4'b0000;
#1	a=4'b0010;	b=4'b1111;
#1	a=4'b1111;	b=4'b1111;
#1	a=4'b0000;	b=4'b1111;
#1	a=4'b0001;	b=4'b1111;

end
endmodule