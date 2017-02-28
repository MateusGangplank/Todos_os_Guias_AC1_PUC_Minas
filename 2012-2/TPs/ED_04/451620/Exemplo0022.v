// -------------------------
// Exemplo0022 – FULL SUBTRACTOR
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// full subtractor
// -------------------------
module fullSubtractor (output S,output Ts,
input a,
input b,
input Te);

wire temp1,temp2,temp3,temp4,temp5,temp6;

xor xor1 ( temp1,a,b );
xor xor2 ( S,temp1,Te );
not not1 ( temp2 , a);
and and1 ( temp3,temp2, b );
and and2 ( temp4,temp2, Te );
and and3 ( temp5,Te, b );
or or1   ( temp6, temp3, temp4 );
or or2   ( Ts, temp6, temp5 );

endmodule // fullSubtractor
module test_fullsubtractor;
// ------------------------- definir dados
reg  x;
reg  y;
reg  Te;
wire [2:0] sub;

fullSubtractor fa1 (sub[0],sub[1],x,y,Te);

// ------------------------- parte principal
initial begin
$display("Exemplo0022 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU’s full subtractor");

x = 0; y = 0; Te = 0;
// projetar testes do modulo
$display("a  b  Te  S  Ts");
#1 $monitor("%b  %b  %b   %b    %b",x,y,Te, sub[0],sub[1]);

#1 x = 0; y = 0; Te = 1;
#1 x = 0; y = 1; Te = 0;
#1 x = 0; y = 1; Te = 1;
#1 x = 1; y = 0; Te = 0;
#1 x = 1; y = 0; Te = 1;
#1 x = 1; y = 1; Te = 0;
#1 x = 1; y = 1; Te = 1;
end
endmodule // test_fullsubtractor