//-------------------------------
// Exercicio 01
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module exercicio01;

reg [4:0]a;

initial begin 

$display("Exercicio01_a");
a = 2 + 14;
$display("a = %d = %b",a,a);
$display("");

$display("Exercicio01_b");
a = 3*7;
$display("a = %d = %b",a,a);
$display("");

$display("Exercicio01_c");
a = 34 / 3;
$display("a = %d = %b",a,a);
$display("");

$display("Exercicio01_d");
a = 19 - 11;
$display("a = %d = %b",a,a);
$display("");

$display("Exercicio01_e");
a= 2*4+6-1;
$display("a = %d = %b",a,a);



end
endmodule // exercicio01