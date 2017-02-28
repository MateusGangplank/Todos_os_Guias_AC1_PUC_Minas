// -------------------------
// Exercicio06Extra
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- complemento de 1
// -------------------------
module comp1Byte (output [7:0] s, input [7:0] p);
       assign s = (~p);
endmodule // comp1Byte
// -------------------------
// Testes complemento de 1
// -------------------------
module exercicio_06;
   // ------------------------- definir dados
   reg [7:0] a;
   wire [7:0] s;
   // ------------------------- instancia
   comp1Byte comp11 (s, a);
   // ------------------------- preparacao
   initial begin:start
           // valores iniciais
           a=0;
   end
   // ------------------------- parte principal
   initial begin:main
           $display("Exercicio06 - Willian Antonio dos Santos - 462020");
           $display("Calcula complemento de 1 de um numero, 1 byte...");
           $monitor("comp1( %b ) = %b", a, s);
           a = 0;
           repeat (255) begin
                  #1 a = a + 1;
           end
   end
endmodule // exercicio