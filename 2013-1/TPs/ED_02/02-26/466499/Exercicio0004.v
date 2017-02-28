// -------------------------
// Exercicio 0004 - COMPLEMENTO DE 2
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// complemento de 2
// -------------------------

module test_base_01;

// ------------------------- definir dados
reg [7:0] a;
//reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;

// ------------------------- parte principal
initial begin
   $display("Exercicio0004 - Davidson Francis - 466499");
   
   a = ~6'b101111+ 1;
   //b = ~'321 + 1;  nao encontrei base 4 para verilog
   c = ~25   + 1;
   d = ~'hD  + 1;
   e = ~'o24 + 1;   

   $display("\nComplemento de 2");
   $display("C2(101111(2)) = %b", a);
   $display("C2(321(4))    = ? "   );
   $display("C2(25(10)     = %b", c);
   $display("C2(D(16))     = %b", d);
   $display("C2(24(8)))    = %b", e);

end
endmodule //  complemento de 2
