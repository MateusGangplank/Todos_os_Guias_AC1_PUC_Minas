// -------------------------
// Exercicio01 - BASE
// Nome: Guilherme alves	
// Matricula: 450161
// -------------------------
// -------------------------
//  Exercicio1
// -------------------------
module teste_ex01;
// ------------------------- definir dados
// ------Dados questao a com os bits nessessarios    
	  
	  reg [1:0] a;
     reg [3:0] b;
     reg [4:0] c;
// ------Dados questao b com os bits nessessarios    
	  
	  reg [1:0] d;
     reg [3:0] e;
     reg [4:0] f;

// ------Dados questao c com os bits nessessarios    
	  
	  reg [5:0] g;
     reg [2:0] h;
     reg [2:0] i;
// ------Dados questao 1 com os bits nessessarios    
	  
	  reg [4:0]j;
     reg [3:0] k;
     reg [3:0] l;
// ------Dados questao 1 com os bits nessessarios    
	  
	  reg [1:0]m;
     reg [2:0]n;
     reg [2:0]o;
	  reg[0:0]p;
	  reg [1:0]q;

// ------------------------- parte principal
initial begin
      $display("Exercicio01 - Guilherme Alves Oliveira - 450161");
      $display("operações");
         
        $display("letra a)---------------------");
		  a = 2;
		  b = 14;
		  c = a+b;
        $display("a = %2b(%d) + \nb = %3b(%d) = \nc = %5b(%d)",a,a,b,b,c,c);
		  $display("b)----------------------------");
		  d = 3;
		  e = 9;
		  f = d * e;
		  
		  $display("d = %2b(%d) * \ne = %3b(%d) = \nf = %5b(%d)",d,d,e,e,f,f);
		  $display("c)---------------------------------");
        g = 32;
		  h = 5;
		  i = g/h;
		  
		  $display("g = %5b(%d) / \nh = %3b(%d) = \ni = %2b(%d)",g,g,h,h,i,i);
		  $display("d)");
		  j=24;
		  k = 11;
		  l = j-k;
		  $display("j = %2b(%d) - \nk = %3b(%d) = \nl = %3b(%d)",j,j,k,k,l,l);
		   $display("e)-------------------------");
		  m =2;
		  n =6;
		  o = 7;
		  p = 1;
		  q = m*n+o-p;
		  $display("m = %2b(%d) * \nn = %2b(%d) + \no = %2b(%d) - \np = %1b(%d)  = \nq = %2b(%d)",m,m,n,n,o,o,p,p,q,q);

end
endmodule //  teste_ex01