//ARQ1 - Eduardo Botelho de Andrade - Guia02

module operations;



//registradores para armazenamento de resultado
reg [7:0] a1; 
reg [7:0] a2; 
reg [7:0] a3; 
reg [7:0] a4;
reg [7:0] a5;
//registradores para os dados iniciais
reg [5:0] r1 = 6'b101010; reg [3:0] r2 = 4'b1101;
reg [4:0] r3 = 5'b11010; reg [3:0] r4 = 4'b1101;
reg [4:0] r5 = 5'b11100; reg [3:0] r6 = 4'b1011;
reg [7:0] r7 = 8'b11001010; reg [7:0] r8 = 8'b10111001;
reg [4:0] r9 = 5'b11001; reg [7:0] r10 = 8'b11000010;

    initial begin
    a1 = r1 + (~r2+1'b1);
    a2 = r3 + (~r4+1'b1);
    a3 = r5 + (~r6+1'b1);
    a4 = r7 + (~r8+1'b1);
    a5 = r9 + (~r10+1'b1);
    end

    initial begin
     $display("Operações entre números e complementos");
     $display("101010(2) - 1101(2)");
     $display("= 101010(2) + C2(1101)");
     $display("= %b\n",a1);

     $display("11010(2) - 15(8)");
     $display("= 11010(2) + C2(1101)");
     $display("= %b\n",a2);

     $display("34(8) - B(16)");
     $display("= 11100(2) + C2(1011)");
     $display("= %b\n",a3);

     $display("CA(16) - 10111001(2)");
     $display("= 11001010(2) + C2(10111001)");
     $display("= %b\n",a4);

     $display("25(10) - 1A(16)");
     $display("= 11001(2) + C2(11000010)");
     $display("= %b\n",a5);
    end
    
endmodule