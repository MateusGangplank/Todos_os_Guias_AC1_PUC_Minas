//----------------------------- 
// Exercicio Extra 12
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ------------------------- 
// ------------------------- 
// -- or gate 
// -------------------------
module orgate ( output s,  input a,b,c,d,e,f,g,h);
  assign s = a | b | c |d |e|f|g|h; 
endmodule // orgate 

module testorgate;
// ------------------------- dados locais 
  reg a, b, c, d, e, f, g, h; // definir registradores 
  wire s; // definir conexao (fio) 
// ------------------------- instancia 
  orgate OR1 (s, a, b, c, d, e, f, g, h);  
// ------------------------- preparacao 
  initial begin:start
    a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
  end 
// ------------------------- parte principal 
  initial begin:main
    $display("Extra0012 - João Henrique Mendes de Oliveira - 392734"); 
    $display("Test circuito"); 
    $display("\na b c d e f g h = s\n");
	 $monitor("%b %b %b %b %b %b %b %b = %b",a,b,c,d,e,f,g,h,s);
      #1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
      #1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=1;
      #1 a=0; b=0; c=0; d=0; e=0; f=0; g=1; h=0;
      #1 a=0; b=0; c=0; d=0; e=0; f=1; g=0; h=0;
      #1 a=0; b=0; c=0; d=0; e=1; f=0; g=0; h=0;
      #1 a=0; b=0; c=0; d=1; e=0; f=0; g=0; h=0;
      #1 a=0; b=0; c=1; d=0; e=0; f=0; g=0; h=0;
      #1 a=0; b=1; c=0; d=0; e=0; f=0; g=0; h=0;
      #1 a=1; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
   end 
endmodule //orgate