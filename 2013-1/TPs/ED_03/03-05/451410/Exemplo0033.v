// -------------------------
// Exemplo0033 
// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------
// Mateus_gate
// -------------------------


module mateus(s1,s2,a,b,chave);

output s1;
output s2;

input a;
input b;
input chave;

wire temp1;
wire temp2;
wire temp3;
wire temp4;
wire temp5;
wire temp6;
wire temp7;
wire temp8;

assign temp1 = a&b;
assign temp3 = (~(a&b));
assign temp7 = temp1&(~chave);
assign temp8 = temp3&chave;
assign s1 = temp8|temp7;

assign temp2 = a|b;
assign temp4 = (~(a|b));
assign temp5 = temp2&(~chave);
assign temp6 = temp4&chave;
assign s2 = temp6|temp5;


endmodule

module testMateus;

reg a;
reg b;
reg chave;

wire s1;
wire s2;

mateus lima(s1,s2,a,b,chave);

initial begin: main

$display("Exemplo0033 - mateus lima batista - 451410");
$display("Test LU's module");
$display ("\na       b     chave     s1      s2");

a = 0;
b = 0;
chave = 0;

$monitor("%b\t%b\t%b\t%b\t%b",a,b,chave,s1,s2);
#1 a = 0; b = 1;chave = 0;
#1 a = 1; b = 0;chave = 0;
#1 a = 1; b = 1;chave = 0;
#1 a = 0; b = 0;chave = 1;
#1 a = 0; b = 1;chave = 1;
#1 a = 1; b = 0;chave = 1;
#1 a = 1; b = 1;chave = 1;

end
endmodule
