// ------------------------------------------------
// Exemplo0035 
// Nome: Miller 
// Matricula: 449048 
// ------------------------------------------------
// Exercicio 5 - Comparador = 0
// ------------------------------------------------

module subtrador (output s0, output carryOut, 
                  input x,input y, input carryIn);
						
assign s0 = x^y;
assign carryOut = ((~x|y)&carryIn)|(~x&y);
endmodule

module comparar (output Ma, output Ig, output Me,
                 input co, input a, input b, input c, input d);

assign Ma = (co|a|b|c|d)&(~co);
assign Ig = ~(co|a|b|c|d);
assign Me = (co|a|b|c|d)&co;

endmodule

module main;

reg [3:0]a, b;
reg ci;
wire s0, s1, s2, s3, v0, v1, v2, v3, ma, ig, me;

subtrador A2(s0, v0, a[0], b[0], ci);
subtrador B2(s1, v1, a[1], b[1], v0);
subtrador C2(s2, v2, a[2], b[2], v1);
subtrador D2(s3, v3, a[3], b[3], v2);
comparar R(ma, ig, me, v3, s3, s2, s1, s0);

initial begin:start
a=4'b0000; b=4'b0000; ci=1'b0;
end

initial begin

$display("Exemplo0035 - Miller - 449048"); 
$display("Comparador");
$display("");
$monitor("%b em relacao a %b e: maior(%b), igual(%b) ou menor(%b)", a, b, ma, ig, me);

#1 a=4'b0000; b=4'b0000;
#1 a=4'b0011; b=4'b1100;
#1 a=4'b0100; b=4'b0010;
#1 a=4'b0001; b=4'b0001;
#1 a=4'b1000; b=4'b0111;
#1 a=4'b1111; b=4'b1110;

end
endmodule

// OBS.: USAR DEFINICOES POR PORTAS !
