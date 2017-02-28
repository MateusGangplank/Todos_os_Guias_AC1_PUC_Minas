// -------------------------
// Exercicio07Extra
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- complemento de 2
// -------------------------
module comp2Byte (output [7:0] s, input [7:0] p);
       assign s = (~p + 1);
endmodule // comp2Byte
// -------------------------
// Testes complemento de 2
// -------------------------
module exercicio_07;
   // ------------------------- definir dados
   reg [7:0] a;
   wire [7:0] s;
   // ------------------------- instancia
   comp2Byte comp21 (s, a);
   // ------------------------- preparacao
   initial begin:start
           // valores iniciais
           a=0;
   end
   // ------------------------- parte principal
   initial begin:main
           $display("Exercicio07 - Willian Antonio dos Santos - 462020");
           $display("Calcula complemento de 2 de um numero, 1 byte...");
           $monitor("comp2( %b ) = %b", a, s);
           a = 0;
           repeat (255) begin
                  #1 a = a + 1;
           end
   end
endmodule // exercicio