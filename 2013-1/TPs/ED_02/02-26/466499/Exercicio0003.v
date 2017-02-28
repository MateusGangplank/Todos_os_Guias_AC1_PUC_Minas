// -------------------------
// Exercicio 0003 - COMPLEMENTO DE 2
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// complemento de 2
// -------------------------

module test_base_01;

// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [4:0] c;
reg [5:0] d;
reg [9:0] e;

// ------------------------- parte principal
initial begin
   $display("Exercicio0003 - Davidson Francis - 466499");
   
   a = ~6'b101010 + 1;
   b = ~'o25 + 1;
   c = ~27   + 1;
   d = ~'h2C  + 1;
   e = ~(25-35) + 1;   

   $display("\nComplemento de 2");
   $display("C2(101010(2)) = %b", a);
   $display("C2(25(8))     = %b", b);
   $display("C2(27(10)     = %b", c);
   $display("C2(2C(16))    = %b", d);
   $display("C2(25-35))    = %b", e);

end
endmodule //  complemento de 2
