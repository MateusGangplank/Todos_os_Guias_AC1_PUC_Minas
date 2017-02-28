// -------------------------
// Exercicio2
// Nome: Gustavo Barbosa
// Matricula: 427410

module operacoes;

reg[6:0]a;
reg[5:0]b;
reg[3:0]c;
reg[6:0]d;
reg[9:0]e;

initial begin
//parte principal
   $display("Exercicio2 - Gustavo Barbosa - 427410");
   $display("Operacoes resultando em binario ");

   a = 6'b101010 + 5'b11010;
   $display("\na = %d = %7b",a,a);

   b = 5'b11010 + 5'o25;
   $display("\nb = %d = %7b",b,b);
   
   c = 10'o1234/6'h2B;
   $display("\nc = %d = %7b",c,c);
   
   d = 9'h1CA - 9'b101110001;
   $display("\nd = %d = %6b",d,d);
   
   e = 5'o25 * 5'o31 + 7'h7A;
   $display("\ne = %d = %6b",e,e);

end
endmodule