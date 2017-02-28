// -------------------------
// Exemplo0006
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------
// -------------------------
// Construir a tabela-verdade para a porta NAND com 2 entradas
// -------------------------

module nand2(output s,input p,input q);
assign  s = (~(a & b));
endmodule

 module testnand;
 reg a,b;
 wire s;
// instancia
 nand2 nand1 (s, a, b);

initial begin:start
//valores iniciais
      a=0; b=0;
   end

// principal
initial begin
   $display("Teste NAND");
   $display("\n~(a|b) = s\n");
   $monitor("  %b   %b %b",s,a,b);

   #1 a=0;b=1;
   #1 a=1; b=0;
   #1 a=1;b=1;
  end
endmodule
