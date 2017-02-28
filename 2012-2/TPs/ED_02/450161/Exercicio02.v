// -------------------------
// Exercicio02 
// Nome: Guilherme alves	
// Matricula: 450161
// -------------------------
// -------------------------
//  Exercicio2
// -------------------------
module teste_ex02;
// ------------------------- definir dados
// ------Dados questao a com os bits nessessarios    
	  
	  reg [6:0] a;
     reg [5:0] b;
     reg [6:0] c;
// ------Dados questao b com os bits nessessarios    
	  
	  reg [4:0] d;
     reg [6:0] e;
     reg [5:0] f;

// ------Dados questao c com os bits nessessarios    
	  
	  reg [9:0] g;
     reg [5:0] h;
     reg [3:0] i;
// ------Dados questao 1 com os bits nessessarios    
	  
	  reg [4:0]j;
     reg [3:0] k;
     reg [3:0] l;
// ------Dados questao 1 com os bits nessessarios    
	  
	  reg [4:0]m;
     reg [4:0]n;
     reg [6:0]o;
	  
	  reg [9:0]q;

// ------------------------- parte principal
initial begin
      $display("Exercicio02 - Guilherme Alves Oliveira - 450161");
      $display("operações");
         
        $display("letra a)---------------------");
		  a = 6'b101010;
        b = 5'b11011;
		  c = a+b;
        $display("a = %2b(%d) + \nb = %3b(%d) = \nc = %5b(%d)",a,a,b,b,c,c);
		  $display("b)----------------------------");
		  d = 5'b11011;
		  e = 8'o25;
		  f = d + e;
		  
		  $display("d = %2b(%d) + \ne = %5b(%d) = \nf = %5b(%d)",d,d,e,e,f,f);
		  $display("c)---------------------------------");
        g = 16'o1234;
		  h = 8'h3C;
		  i = g/h;
		  
		  $display("g = %5b(%d) / \nh = %3b(%d) = \ni = %2b(%d)",g,g,h,h,i,i);
		  $display("d)");
		  j=24;
		  k = 11;
		  l = j-k;
		  $display("j = %2b(%d) - \nk = %3b(%d) = \nl = %3b(%d)",j,j,k,k,l,l);
		   $display("e)-------------------------");
		  m =25;
		  n =5'o32;
		  o = 8'h7a;
		
		  q = m*n+o;
		  $display("m = %2b(%d) * \nn = %2b(%d) + \no = %2b(%d)  = \nq = %2b(%d)",m,m,n,n,o,o,q,q);

end
endmodule //  teste_ex02