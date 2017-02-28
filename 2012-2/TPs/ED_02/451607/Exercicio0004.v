// -------------------------
// Exercicio0004 - BASE
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0004 - Rafael Guimarães de Sousa - 451607");

a = 'b101011;
b = 'b111001; // -- 321(4) 
c = 27;
d = 'hC;
e = 'o21;

$display("a = %b = %b",~a,~a+~a);
$display("b = %b = %b",~b,~b+~b);
$display("c = %d = %d",~c,~c+~c);
$display("d = %h = %h",~d,~d+~d);
$display("e = %o = %o",~e,~e+~e);

end
endmodule