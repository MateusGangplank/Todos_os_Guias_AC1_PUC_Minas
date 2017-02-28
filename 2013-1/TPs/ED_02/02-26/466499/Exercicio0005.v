// -------------------------
// Exercicio 0005 - SUBTRACAO COM COMPLEMENTO DE 2
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// subtracao com complemento de 2
// -------------------------

module test_base_01;

// ------------------------- definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

// ------------------------- parte principal
initial begin
   $display("Exercicio0005 - Davidson Francis - 466499");
   
   a = 6'b101011 + ~(4'b1001)+1;
   b = 5'b10011  + ~('o15)+1;
   c = 'o35      + ~('hC)+1;
   d = 'hBA      + ~(8'b10111001)+1;
   e = 37        + ~('h1B)+1;   

   $display("\nsubtracao com complemento de 2");
   $display("101011(2) + C2(1001(2))     = %b", a);
   $display("10011(2)  + C2(15(8))       = %b", b);
   $display("35(8)     + C2(C(16)        = %b", c);
   $display("BA(16)    + C2(10111001(2)) = %b", d);
   $display("37(10)    + C2(1B(16))      = %b", e);

end
endmodule //  subtracao com complemento de 2
