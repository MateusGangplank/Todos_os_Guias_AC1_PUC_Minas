// -------------------------
// Exercicio 0002 - OPERACOES
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// operacoes
// -------------------------

module test_base_01;

// ------------------------- definir dados
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;

// ------------------------- parte principal
initial begin
   $display("Exercicio0002 - Davidson Francis - 466499");
   
   a = 6'b100110 + 5'b11011;
   b = 5'b11101  + 'o25;
   c = 'o1234    / 'h4C;
   d = 'h1BA     - 9'b101110011;
   e = 25 * 'o32 + 'h8A;   

   $display("\nOperacoes");
   $display("100110(2) + 11011(2)     = %b", a);
   $display("11101(2)  + 25(8)        = %b", b);
   $display("1234(8)   / 4C(16)       = %b", c);
   $display("1BA(16)   - 101110011(2) = %b", d);
   $display("25 * 32(8) + 8A(16)      = %b", e);

end
endmodule // operacoes

