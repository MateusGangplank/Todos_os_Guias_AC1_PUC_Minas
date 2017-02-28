// -------------------------
// Exercicio4
// Nome: Gustavo Barbosa
// Matricula: 427410

module complementos;

reg [5:0] a1 = 6'b101010;
reg [4:0] a2 = 5'b11011;
reg [4:0] a3 = 5'b10111;
reg [3:0] a4 = 4'b1110;
reg [4:0] a5 = 5'b10110;

//registradores 
   reg [7:0] b1;
   reg [6:0] b2;
   reg [5:0] b3;
   reg [4:0] b4;
   reg [7:0] b5;

initial begin
//parte principal
  $display("Exercicio4 - Gustavo Barbosa - 427410");
  $display("Complemento de dois ");

 b1 = ~a1 + 1'b1;
 $display("\na1 = %b",a1);
 $display("C(a1) = %b",b1);

 b2 = ~a2 + 1'b1;
 $display("\na1 = 123(4) = %b",a1);
 $display("C(a2) = %b",b2);

 b3 = ~a3 + 1'b1;
 $display("\na3 = 23(10) = %b",a1);
 $display("C(a3) = %b",b3);

 b4 = ~a4 + 1'b1;
 $display("\na4 = E(16) = %b",a1);
 $display("C(a4) = %b",b4);

 b5 = ~a5 + 1'b1;
 $display("\na5 = 26(8) = %b",a1);
 $display("C(a5) = %b",b5);

  end
  endmodule