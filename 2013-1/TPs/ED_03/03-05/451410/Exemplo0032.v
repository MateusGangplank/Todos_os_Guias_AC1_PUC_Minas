// -------------------------
// Exemplo0032 
// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------
// Mateus_gate
// -------------------------


module mateus(s,a,b,chave);

output s;

input a;
input b;
input chave;

wire temp1;
wire temp2;
wire temp3;
wire temp4;

assign temp1 = a&b;
assign temp2 = a|b;
assign temp3 = temp1&chave;
assign temp4 = temp2&(~chave);
assign s = temp3 | temp4;

endmodule

module testMateus;

reg a;
reg b;
reg chave;

wire s;

mateus lima(s,a,b,chave);

initial begin: main

$display("Exemplo0031 - mateus lima batista - 451410");
$display("Test LU's module");

a = 0;
b = 0;
chave = 0;

$monitor("a = %3b b = %3b\nchave =%3b\ns = %3b",a,b,chave,s);
#1 a = 0; b = 1;chave = 0;
#1 a = 1; b = 1;chave = 0;
#1 a = 1; b = 0;chave = 0;
#1 a = 0; b = 0;chave = 1;
#1 a = 0; b = 1;chave = 1;
#1 a = 1; b = 1;chave = 1;
#1 a = 1; b = 0;chave = 1;

end
endmodule
