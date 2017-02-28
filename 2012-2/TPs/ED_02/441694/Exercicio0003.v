// -------------------------
// Exercicio0003
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [6:0] a;
reg [5:0] b;
reg [5:0] c;
reg [6:0] d;
reg [4:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0003 - Lucas Cardoso - 441694");

//a.) 100110(2)
 
a = 'b100110;

$display("\na = %d = %b", a, a);
$display("\nC2 de a = %b\n", -a); 
 

// b.) 24(8)

b = 'o24;

$display("\nb = %d = %b", b, b);
$display("\nC2 de b = %b\n", -b);  

// c.) 25(10)

c = 25;

$display("\nc = %d = %b", c, c);
$display("\nC2 de c = %b\n", -c); 

// d.) 2D(16)

d = 'h2D;

$display("\nd = %d = %b", d, d);
$display("\nC2 de d = %b\n", -d); 

// e.) 27 - 37

e = 27 - 37;

$display("\ne = %d = %b", e, e);
$display("\nC2 de e = %b\n", -e); 

end
endmodule // test_base
