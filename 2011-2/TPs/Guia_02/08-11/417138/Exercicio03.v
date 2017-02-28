//-------------------------------
// Exercicio03 
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module exercicio03;

reg [5:0]a;

initial begin

$display("Exercicio03_a");
a = ~6'b100111;
$display("a = %b",a);

$display("Exercicio03_b");
a= ~6'o54;
$display("a = %b",a);

$display("Exercicio03_c");
a= ~4'd13;
$display("a = %b",a);

$display("Exercicio03_d");
a = ~5'h1B;
$display("a = %b",a);

$display("Exercicio03_e");
a= ~25 - 36;
$display("a = %b",a);

end 
endmodule