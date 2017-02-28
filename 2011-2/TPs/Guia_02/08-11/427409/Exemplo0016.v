// ------------------------- 
// Exemplo0016 - BASE 
// Nome: Guilherme Rodrigues Melo de Oliveira 
// Matricula: 427409
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module test_base_02;

reg [1:0] a; 
reg [3:0] b; 
reg [4:0] c; 


initial begin
$display("Exemplo0016 - Guilherme Rodrigues Melo de Oliveira - 427409");

a = 2;
b = 14;
c = a+ b;

$display("\n");
$display("\nExercicio01");
$display("\n");
$display("\nA)");
$display("a = %d = %b", a,a);
$display("b = %d = %b", b,b);
$display("a + b = %d = %b", c,c);



end
endmodule 

module test_base_03;

reg [1:0] a; 
reg [2:0] b; 
reg [4:0] c; 

initial begin



a = 3;
b = 7;
c = a * b; 
$display("\n");
$display("\nB)");
$display("a = %d = %b", a,a);
$display("b = %d = %b", b,b);
$display("a * b = %d = %b", c,c);
end
endmodule

module test_base_04;

reg [5:0] a; 
reg [1:0] b; 
reg [3:0] c; 


initial begin

a = 34;
b = 3;
c = a/b;
$display("\n");
$display("\nC)");
$display("a = %d = %b ",a,a);
$display("b = %d = %b", b,b);
$display("a / b = %d = %b", c,c);

end
endmodule

module test_base_05;

reg [4:0] a; 
reg [3:0] b; 
reg [3:0] c; 


initial begin


a = 19;
b = 11;
c = a - b;
$display("\n");
$display("\nD)");
$display("a = %d = %b", a,a);
$display("b = %d = %b", b,b);
$display("a - b = %d = %b", c,c);

end
endmodule

module test_base_06;

reg [1:0] a; 
reg [2:0] b; 
reg [2:0] c; 
reg [0:0] d;
reg [3:0] e;

initial begin

a = 2;
b = 4;
c = 6;
d = 1;
e = (a*b)+c-d;
$display("\n");
$display("\nE)");
$display("a = %d = %b", a,a);
$display("b = %d = %b", b,b);
$display("c = %d = %b", c,c);
$display("d = %d = %b", d,d);
$display("a * b + c - d = %d = %3b", e,e); 

end
endmodule