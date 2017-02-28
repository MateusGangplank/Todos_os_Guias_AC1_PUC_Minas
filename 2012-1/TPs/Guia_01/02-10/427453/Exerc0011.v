// ------------------------- 
// Exerc0011
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// --------------------- 
// --------------------- 
module andtestgate (output s, 
input [0:7] r); 
wire w1,w2,w3,w4,w5,w6;
and as1 (w1, r[0], r[1]);
and as2 (w2, w1, r[2]);
and as3 (w3, w2, r[3]);
and as4 (w4, w3, r[4]);
and as5 (w5, w4, r[5]);
and as6 (w6, w5, r[6]);
and as7 (s, w6, r[7]);
endmodule // and 
// --------------------- 
// -- test ANDTESTgate 
// --------------------- 
module testandtestgate; 
// ------------------------- dados locais 
reg [0:7] a; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andtestgate AND1 (s, a); 
// ------------------------- preparacao 
initial begin:start 
a= 8'b00000000; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exerc0011 - Pedro Henrique Vilar Locatelli  - 427453"); 
$display("Test andtest gate"); 
$display("\n a = s\n");
$monitor("%b = %b", a, s); 
#1 a=8'b00000001;
#1 a=8'b00000001;
#1 a=8'b00000001;
#1 a=8'b00110001;
#1 a=8'b11111111;
#1 a=8'b00111101;
#1 a=8'b00000001;
#1 a=8'b01110001;
#1 a=8'b00000110;
#1 a=8'b00000001;
end 
endmodule // testandtestgate 