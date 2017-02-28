// ------------------------- 
//--Construir a tabela_verdade para a porta OR com 4 entradas. 
//--Obs.: Criar um módulo que use outros módulos OR de 2 entradas.        
//----------------------------- 
// Exercicio10 - OR 
// Nome: Milton costa teles da silva
// Matricula: 002751

// ---------------------
// -- or gate01
// ---------------------

module orgate1 (output s, input p, input q );
 assign s = p | q ;
endmodule // orgate1

module orgate4(output s, input a, input b, input c, input d);
	wire aux1,aux2;
	orgate1 or1(aux1,a,b);
	orgate1 or2(aux2,c,d);
	orgate1 or3(s,aux1,aux2);
endmodule //orgate4
// ---------------------
// -- test or gate
// ---------------------

module testandgate;
  reg   a , b , c , d;//definir registradores
  wire  s;//conexão(fio)
//---------- instancia
  or OR1(s1,a,b);
  or OR2(s2,c,d);
  or OR3(s,s1,s2);
// ------------------------- preparacao
  initial begin:start 
  a=0; b=0; c=0; d=0;
end 
// ------------------------- parte principal 
  initial begin:main
      $display("Exercicio10 -  Milton teles da silva - 002751");
      $display("Test OR gate");
      $display("\na | b | c | d | e | f | g | h = s\n");
  
$monitor("%b | %b | %b | %b = %b" ,  a , b , c , d, s);     
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
endmodule // testorgate
