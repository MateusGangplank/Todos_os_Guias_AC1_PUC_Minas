// -------------------------
// Exemplo0018 - BASE 
// Nome: Guilherme Rodrigues Melo de Oliveira 
// Matricula: 427409
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [0:0] c; 
reg [5:0] d;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0018 - Guilherme Rodrigues Melo de Oliveira - 427409");

a = 39;
b = 24;
c = 1;
d = b + c;

$display("\n");
$display("\nExercicio03");
$display("\n");
$display("\nA)");
$display("a = %b", a);
$display("b = %b", b);
$display("b + 1 = %b", d);

end 
endmodule // test_base 

module test_base_02; 

reg [5:0] a; 
reg [5:0] b; 
reg [0:0] c; 
reg [5:0] d;

initial begin 


a = 44;
b = 19;
c = 1;
d = b + c;

$display("\n");
$display("\nB)");
$display("a = %o = %b", a,a);
$display("b = %b",b);
$display("b + 1 = %b", d);

end 
endmodule

module test_base_03; 

reg [3:0] a; 
reg [3:0] b; 
reg [0:0] c;
reg [3:0] d; 

initial begin 


a = 13;
b = 2;
c = 1;
d = b + c;

$display("\n");
$display("\nC)");
$display("a = %d = %b", a,a);
$display("b = %b",b);
$display("b + 1 = %b", d);

end 
endmodule

module test_base_04; 

reg [4:0] a; 
reg [4:0] b; 
reg [0:0] c; 
reg [4:0] d;
initial begin 


a = 27;
b = 4;
c = 1;
d = b + c;
 
$display("\n");
$display("\nD)");
$display("a = %h = %b", a,a);
$display("b = %b", b);
$display("b + 1 = %b", d);

end 
endmodule

module test_base_05; 

reg [4:0] a; 
reg [5:0] b; 
reg [5:0] c; 

 
initial begin 


a = 25;
b = 28;
c = a + b ;


$display("\n");
$display("\nE)");
$display("a = %d = %b", a,a);
$display("b = %b",b);
$display("a + C2(36) = %b", c);

end 
endmodule

// OBS.: FICARIA MELHOR USAR AS PORTAS PARA CALCULAR OS VALORES
//       E NAO FORNECE-LOS COMO CONSTANTES.