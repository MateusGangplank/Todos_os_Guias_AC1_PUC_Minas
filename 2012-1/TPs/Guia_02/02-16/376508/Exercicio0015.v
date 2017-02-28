//-------------------
// Exercicio0015 -- 8bits e subtração de complemento para dois
// Nome: Felipe Barros
// Matricula: 376508
// -------------------


module bitsEcomplemento2;

//-- definir dados
reg[7:0] a;
reg[7:0] b;
reg[7:0] c;
reg[7:0] d;
reg[7:0] e;

//--parte princpal
initial begin
a= 8'b101010 - 8'b1101;
b= 8'b11010 -  8'o15;
c= 8'o34 - 8'hB;
d= 8'hCA - 8'b10111001;
e= 8'd25 - 8'h1A;

//-- Escrever na tela
$display ("\nresultado de complemento de dois com limite de binario\n" );
$display ("a= %8b", a );
$display ("b= %8b", b );
$display ("c= %8b", c );
$display ("d= %8b", d );
$display ("e= %8b", e );
end
endmodule