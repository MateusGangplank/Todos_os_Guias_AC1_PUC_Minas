// -------------------------
// Exemplo0021 – Complemento de 2
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -----------
// --------------
// -------------------------

module test_complementador;
// ------------------------- definir dados
reg [2:0] x;
reg c2;
wire [10:0] temp;
wire co; 
wire [2:0]s;

not(temp[0], x[0]);
not(temp[1], x[1]);
not(temp[2], x[2]);
xor(s[0], c2, temp[0]);
and(temp[3], c2, temp[0]);
xor(s[1], temp[3], temp[1]);
and(temp[4], temp[3], temp[1]);
xor(s[2], temp[4], temp[2]);
and(co, temp[4], temp[2]);

// ------------------------- parte principal
initial begin
$display("Exemplo0021 - Herbert Alves - 461971");
$display("Test Complementador");
$display("\n x --> C2 = carry n\n");
 x=3'b111; c2=1;
#1 $display("%b --> C2 = %b %b", x, co, s);
#1 x=3'b110;
$monitor("%b --> C2 = %b %b", x, co, s);
#1 x=5;
#1 x=4;
end
endmodule // test_complementador