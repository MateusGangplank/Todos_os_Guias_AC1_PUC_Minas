// -------------------------
// Exercicio3
// Nome: Gustavo Barbosa
// Matricula: 427410

module operacoes;

reg [4:0] a1;
reg [3:0] a2;
reg [3:0] a3;
reg [4:0] a4;
reg [4:0] a5;

initial begin
//parte principal
  $display("Exercicio3 - Gustavo Barbosa - 427410");
  $display("Complemento de dois ");
  
  a1 = ~(6'b100111) + 1;
  $display("\nC(a1) = %b",a1);
  
  a2 = ~(5'b10011)+ 1;
  $display("\nC(a2) = %b",a2);
  
  a3 = ~(5'b10111) + 1;
  $display("\nC(a3) = %b",a3);

  a4 = ~(6'b101011) + 1;
  $display("\nC(a4) = %b",a4);
  
  a5 = ~(5'b11001 + (~6'b100100) + 1) + 1;
  $display("\nC(a5) = %b",a5);
end
endmodule