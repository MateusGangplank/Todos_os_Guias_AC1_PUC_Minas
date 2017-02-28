// -------------------------
// guia0201 - resultantes em binario
// Nome:Felipe Barros Silva
// Matricula: 376508
// -------------------------


//-- criar module
module guia0201;

reg [3:0] a;
reg [3:0] b; 
reg [3:0] c;
reg [3:0] d;
reg [3:0] e;

//--parte principal

initial begin

$display ("Felipe Barros - 376508 ");
#1 $display ("guia0201 - calcula decima para binario.");

//-- definir dados
a = 2 + 14;
b = 3 * 9;
c = 32 / 5;
d = 24 - 11;
e = 2 * 6 + 7 - 1;
 
 //--resultante
#1 $monitor ("a= %4b \nb= %4b \nc= %4b \nd= %3b \ne= %4b\n", a, b, c, d, e);

 
 
end
endmodule

//--------------------------------------------------------------

module guia0202;

reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [9:0] e;

initial begin
#3 $display ("guia0202 - calcula apenas em binario");

//--definir dados
a = 6'b101010 + 5'b11011;
b = 5'b11011 + 8'o25;
c = 10'o1234 / 8'h3C;
d = 10'h1BA - 9'b101110001;
e = 25 * 8'o32 + 8'h7A; 

//-- resultante  
#3 $monitor ("a= %3b \nb= %5b \nc= %4b \nd= %4b \ne= %3b\n", a, b, c, d, e);

end
endmodule
  
//---------------------------------------------------------

module guia0203;

//-- definir os dados
reg [6:0] a;
reg [4:0] b;
reg [4:0] c;
reg [7:0] d;
reg [4:0] e;

// -- parte principal
initial begin
#8 $display ("guia0203 - complemento de 2");

//-- calculo para complemento de 2
a = -6'b100110;
b = -5'o24;
c = -5'd25;
d = -8'h2D;
e = 27 - 37;

#8 $monitor ("a= %6b \nb= %5b \nc= %5b \nd= %8b \ne= %4b\n", a, b, c, d, e);

end
endmodule

//---------------------------------------------------------------

module guia0204;

//--definir dados
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;

//-- parte principal
initial begin

#20 $display ("guia0204 - complemento de 2 com comprimento dos bits");

//--calculo binarios para complemnto de 2
a= -8'b101011;
b= -7'o32;
c= -6'd27;
d= -5'hC;
e= -8'o21;

#20 $monitor ("a= %8b \nb= %8b \nc= %8b \nd= %8b \ne= %8b\n", a, b, c, d, e);

end
endmodule
//---------------------------------------------

module guia0205;

//-- definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

//--parte principal

initial begin
#45 $display ("guia0205 - calculo binario com subtração");

//-- calculo
a = 6'b101010 - 4'b1001;
b = 5'b11011 - 4'o15;
c = 5'o34 - 4'hC;
d = 8'hDA - 8'b10111001;
e = 5'd27 - 8'h1B;

//--resultante
#45 $monitor ("a= %8b \nb= %8b \nc= %8b \nd= %8b \ne= %8b\n", a, b, c, d, e);

end
endmodule

// OBS.: SE POSSIVEL, SEPARAR EM ARQUIVOS DIFERENTES.
