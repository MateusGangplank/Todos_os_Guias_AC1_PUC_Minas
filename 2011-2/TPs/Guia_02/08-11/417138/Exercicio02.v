//-------------------------------
// Exercicio 02
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module exercicio02;

reg [7:0]a;

initial begin

$display("Exercicio02_a");
a = 6'b100010 + 5'b11010;
$display("a = %b",a);

$display("Exercicio02_b");
a=5'b11010 + 5'o23 ;
$display("a = %b",a);

$display("Exercicio02_c");
a=12'o1234 / 12'h2D;
$display("a = %b",a);

//$display("Exercicio02_d");
//a= 12'h1A9 – 12'b101101001;
//$display("a = %b",a);

//$display("Exercicio01_e")
//a= 7'd25 * 7'd41 + 7'h6B;
//$display("a = %b",a);




 

end 

endmodule // exercicio02
