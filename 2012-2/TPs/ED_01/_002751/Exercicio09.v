// ------------------------- 
//--Construir a tabela_verdade para a porta AND com 4 entradas. 
//--Obs.: Criar um módulo que use outros módulos AND de 2 entradas         
//----------------------------- 
// Exercicio09 - AND 
// Nome: Milton costa teles da silva
// Matricula: 002751-
// ---------------------
// -- and gate
// ---------------------

module andgate1 (output s, input p,input q );
 assign s = p & q ;
endmodule // andgate1

module andgate4input(output s, input a, input b, input c, input d);	
	wire aux1,aux2;
	andgate1 and1(aux1,a,b);
	andgate1 and2(aux2,c,d);
	andgate1 and3(s,aux1,aux2);
endmodule
// ---------------------
// -- test and gate
// ---------------------

module testandgate;
  reg   a , b , c , d;//definir registradores
  wire  s;//conexão(fio)
//---------- instancia
  and AND1(s1,a,b);
  and AND2(s2,c,d);
  and AND3(s,s1,s2);
// ------------------------- preparacao
 initial begin:start 
  a=0; b=0; c=0; d=0;
end 


 initial begin:main 
      $display("Exercicio09 -  Milton teles da silva - 002751");
      $display("Test AND gate");
      $display("\na & b & c  & d= s\n");
  
$monitor("%b & %b & %b & %b = %b" ,  a , b , c , d, s);     
      #1 a=0; b=0; c=0; d=1;
      #1 a=0; b=0; c=1; d=0;
      #1 a=0; b=0; c=1; d=1;
		#1 a=0; b=1; c=0; d=0;
		#1 a=0; b=1; c=0; d=1;
		#1 a=0; b=1; c=1; d=0;
		#1 a=0; b=1; c=1; d=1;
		#1 a=1; b=0; c=0; d=0;
      #1 a=1; b=0; c=0; d=1;
      #1 a=1; b=0; c=1; d=0;
		#1 a=1; b=0; c=1; d=1;
		#1 a=1; b=1; c=0; d=0;
		#1 a=1; b=1; c=0; d=1;
		#1 a=1; b=1; c=1; d=0;
		#1 a=1; b=1; c=1; d=1;
 end
endmodule // testandgate
