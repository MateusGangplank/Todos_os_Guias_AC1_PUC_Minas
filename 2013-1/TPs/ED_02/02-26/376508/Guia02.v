//----------------------
// Guia02 
//	Nome: Felipe Barros Silva
//	Matricula: 376508
// ------------------------

//-- Cria module para comandar
module guia0201;

//--definir os dados de entrada
reg [4:0] a;
reg [4:0] b;
reg [5:0] c;
reg [3:0] d;
reg [4:0] e;

//--parte principal
initial begin
#1$display ("Nome: Felipe Barros\nMatricula: 376508");
#1$display ("Guia0201 - calcula e resultante com minimo quantidade de bits\n ");

//--definir dados
a= 3+14;
b= 3*8;
c= 33/5;
d= 25-11;
e= 2*8+7-1;

//--imprima e resultante
#1$monitor ("a= %5b \nb= %5b \nc= %6b \nd= %b \ne =%5b \n", a, b, c, d, e);

//--termina programa
end
endmodule

//--Guia0202

module guia0202;

//-- definir dados de entrada

reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [8:0] e;

//-- parte principal

initial begin

#20$display ("guia0202 - calcula e resultante apenas para binario/n");
a= 6'b100110 + 5'b11011;
b= 5'b11101 + 8'o25;
c= 10'o1234 / 10'h4C;
d= 9'h1BA - 10'b101110011;
e= 25 * 8'h8A;

//--calcula e imprima resultante
#20$monitor ("a= %7b \nb= %6b \nc= %4b \nd= %7b \ne =%9b \n", a, b, c, d, e);

//--termina programa
end
endmodule


module guia0203;

//--definir dados de entrada
reg[6:0]a;
reg[7:0]b;
reg[7:0]c;
reg[7:0]d;
reg[5:0]e;

//--parte principal
initial begin

//-- definir os dados e calcula complemento de 2
a= -7'b101010;
b= -8'o25;
c= -27;
d= -8'h2C;
e= -6'o26;
#60$display("guia0203 - resultante de complemento de dois\n");
#60$monitor ("a= %7b \nb= %6b \nc= %4b \nd= %7b \ne =%6b \n", a, b, c, d, e);



//--termina programa
end
endmodule


module guia0204;

//--definir dados de entrada
reg[7:0]a;
reg[6:0]b;
reg[5:0]c;
reg[4:0]d;
reg[7:0]e;

//--parte principal
initial begin

//-- definir os dados e calcula complemento de 2
a= -8'b101111;
b= -321;
c= -25;
d= -5'hD;
e= -8'o24;
#150$display("guia0204 - resultante de complemento de dois com bits de comprimento\n");
#150$monitor ("a= %7b \nb= %6b \nc= %4b \nd= %7b \ne =%6b \n", a, b, c, d, e);



//--termina programa
end
endmodule

module guia0205;

//--definir dados de entrada
reg[8:0]a;
reg[8:0]b;
reg[8:0]c;
reg[8:0]d;
reg[8:0]e;

//--parte principal
initial begin

//-- definir os dados e calcula complemento de 2
a= 8'b101011 - 8'b1001;
b= 8'b10011 - 8'o15;
c= 8'o35 - 8'hC;
d= 8'hBA - 8'b10111001;
e= 37- 8'h1B;
#350$display("guia0205 - resultante de calculo\n");
#350$monitor ("a= %8b \nb= %8b \nc= %8b \nd= %8b \ne =%8b \n", a, b, c, d, e);

//--termina programa
end
endmodule