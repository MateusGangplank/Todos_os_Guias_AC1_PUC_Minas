// -------------------------
// Exercicio5
// Nome: Gustavo Barbosa
// Matricula: 427410

module operacoes;

reg [6:0] b1;
reg [7:0] b2;
reg [6:0] b3;
reg [7:0] b4;
reg [7:0] b5;

reg [5:0] a1 = 6'b101010;
reg [3:0] a2 = 4'b1101;
reg [4:0] a3 = 5'b11010;
reg [3:0] a4 = 4'b1101;
reg [4:0] a5 = 5'b11100;
reg [3:0] a6 = 4'b1011;
reg [7:0] a7 = 8'b11001010;
reg [7:0] a8 = 8'b10111001;
reg [4:0] a9 = 5'b11001;
reg [7:0] a10 = 8'b11000010;



    initial begin
     $display("Exercicio5 - Gustavo Barbosa - 427410");
     $display("Operacoes");

     b1 = a1 + (~a2+1'b1);
     $display("\n101010(2) - 1101(2) = ");
     $display("101010(2) + C2(1101) = ");
     $display("%b",b1);

     b2 = a3 + (~a4+1'b1);
     $display("\n11010(2) - 15(8) = ");
     $display("11010(2) + C2(1101) = ");
     $display("%b",b2);

     b3 = a5 + (~a6+1'b1);
     $display("\n34(8) - B(16) = ");
     $display("11100(2) + C2(1011) = ");
     $display("%b",b3);

     b4 = a7 + (~a8+1'b1);
     $display("\nCA(16) - 10111001(2) = ");
     $display("11001010(2) + C2(10111001) = ");
     $display("%b",b4);

     b5 = a9 + (~a10+1'b1);
     $display("\n25(10) - 1A(16) = ");
     $display("11001(2) + C2(11000010) = ");
     $display("%b",b5);
    end
    
endmodule