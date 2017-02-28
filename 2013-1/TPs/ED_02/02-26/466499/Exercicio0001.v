// -------------------------
// Exercicio 0001 - OPERACOES
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// operacoes
// -------------------------

module test_base_01;

// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;

// ------------------------- parte principal
initial begin
   $display("Exercicio0001 - Davidson Francis - 466499");
   
   a = 3 + 14;
   b = 3 * 8;
   c = 33 / 5;
   d = 25 - 11;
   e = 2 * 8 + 7 - 1;   

   $display("\nOperacoe");
   $display("3 + 14        = %b", a);
   $display("3 * 8         = %b", b);
   $display("33 / 5        = %b", c);
   $display("25 - 11       = %b", d);
   $display("2 * 8 + 7 - 1 = %b", e);

end
endmodule // test_base

