// -------------------------
// Exercicio0004
// Nome: Lucas Cardoso
// Matricula: 441694
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
$display("Exercicio0004 - Lucas Cardoso - 441694");

//a.) 101011(2)
 
a = 'b101011;

$display("\na = %d = %b", a, a);
$display("\nC2 de a = %b\n", -a); 
 

// b.) 321(4) = 111001(2)

b = 'b111001;

$display("\nb = %d = %b", b, b);
$display("\nC2 de b = %b\n", -b);  

// c.) 27(10)

c = 27;

$display("\nc = %d = %b", c, c);
$display("\nC2 de c = %b\n", -c); 

// d.) C(16)

d = 'hC;

$display("\nd = %d = %b", d, d);
$display("\nC2 de d = %b\n", -d); 

// e.) 21(8)

e = 'o21;

$display("\ne = %d = %b", e, e);
$display("\nC2 de e = %b\n", -e); 

end
endmodule // test_base
