// ------------------------- 
//--Definir e testar um módulo com uma expressão envolvendo portas 
//--de um circuito capaz de receber um byte e 
//--retornar 1, se todos os seus bits forem iguais a 0.   
//----------------------------- 
// Exercicio -circuito 
// Nome: Milton costa teles da silva
// Matricula: 2751
// ------------------------- 
// ------------------------- 
// -- or gate 
// -------------------------
module orgate ( output s1,  input p,input q,input r,input t);
  assign s = p | q | r | t;
endmodule // orgate 
// --------------------- 
// -- and gate 
// ---------------------         
module andgate ( output s2,   input p,input q,input r,input t);
  assign s = (p & q & r & t);
endmodule // andgate 
// -------------------
// -- nor gate
// -------------------
module norgate(output s, input p,input q);
  assign s = ~(~(p|q)); 
endmodule // norgate

module circuito;
// ------------------------- dados locais 
  reg a, b, c, d, e, f, g, h; // definir registradores 
  wire s; // definir conexao (fio) 
// ------------------------- instancia 
  orgate OR1 (s1, a, b, c, d); 
  andgate AND1 (s2, e, f, g, h);
  norgate NOR1 (s, s1, s2);  
// ------------------------- preparacao 
  initial begin:start
    a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0; 
  end 
// ------------------------- parte principal 
  initial begin:main
    $display("Exercicio04 -  Milton teles da silva - 2751"); 
    $display("Test circuito gate"); 
 $display("\na b c d e f g h = s\n");
	$monitor("%b %b %b %b %b %b %b %b = %b",a,b,c,d,e,f,g,h,s);
   #1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
  end 
endmodule // circuito