// -------------------------
// Exemplo0025 – Complemento de 2
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
// Exercicio 5
// ------------------------- 
//  Complemento de 2
// -------------------------
//--Quanto falta para todos os bits igual a 1, mais 1;


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

module Registros;

reg [3:0]a, b,aux;
reg ci, ci2;
wire s0, s1, s2, s3;
wire co0, co1, co2, co3, cf, final;
wire ad1, ad2, ad3, ad4, cd1, cd2, cd3;

subtrador A(s0, co0, a[0], b[0], ci);
subtrador B(s1, co1, a[1], b[1], co0);
subtrador C(s2, co2, a[2], b[2], co1);
subtrador D(s3, co3, a[3], b[3], co2);


fullAdder X(ad1, cf, aux[0], s0, ci2);
fullAdder Y(ad2, cd1, aux[1], s1, cf);
fullAdder Z(ad3, cd2, aux[2], s2, cd1);
fullAdder W(ad4, cd3, aux[3], s3, cd2);



initial begin:start

a=4'b1111; b=4'b0000;
ci2=1'b1; ci=1'b1; aux=4'b0000;

end

initial begin
$display("Miller - 449048");
$display("Testes de Complemento de 2");
$display("");
$monitor("%b em C2 =  %b %b%b%b%b", b, cd3, ad4, ad3, ad2, ad1 );

#1 b=4'b0110;
#1 b=4'b0010;
#1 b=4'b0111;
#1 b=4'b0101;
#1 b=4'b1001;
#1 b=4'b0100;
#1 b=4'b0000;
#1 b=4'b1111;

end
endmodule

// OBS.: EXPERIMENTE USAR DEFINICOES POR PORTAS !

