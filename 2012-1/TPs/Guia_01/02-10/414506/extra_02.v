// ------------------------- 
//--Definir e testar um módulo com uma expressão envolvendo portas 
//--de um circuito capaz de receber um byte e 
//--retornar 1, se algum de seus bits for igual a 1.    
//----------------------------- 
// Exercicio -circuito2 
// Nome: Fernando Silva
// Matricula: 414506
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
    $display("Extra02 -  Fernando Silva - 414506"); 
    $display("Test circuito2 gate"); 
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