// -------------------------
// Exercicio05
// Nome: Guilherme alves	
// Matricula: 450161
// -------------------------
// -------------------------
//  Exercicio5
// -------------------------
module teste_ex05;
// ------------------------- definir dados
// ------Dados questao a com os bits nessessarios    
	  
	  reg [7:0] a;
     reg [7:0] b;
     reg [7:0] c;
// ------Dados questao b com os bits nessessarios    
	  
	  reg [7:0] d;
     reg [7:0] e;
     reg [7:0] f;

// ------Dados questao c com os bits nessessarios    
	  
	  reg [7:0] g;
     reg [7:0] h;
     reg [7:0] i;
// ------Dados questao 1 com os bits nessessarios    
	  
	  reg [7:0]j;
     reg [7:0] k;
     reg [7:0] l;
// ------Dados questao 1 com os bits nessessarios    
	  
	  reg [7:0]m;
     reg [7:0]n;
     reg [7:0]o;
	
// ------------------------- parte principal
initial begin
      $display("Exercicio05 - Guilherme Alves Oliveira - 450161");
      $display("operações com complemento de 2");
         
        $display("letra a)---------------------");
		  a = 8'b101010;
        b = 8'b1001;
		  b = ~b + 1;
		  c = a+b;
        $display("a = %8b(%d) + \nb = %8b(%d) = \nc = %8b(%d)",a,a,b,b,c,c);
		  $display("b)----------------------------");
		  d = 5'b11011;
		  e = 8'o15;
		  e = ~e + 1;
		  f = d + e;
		  
		  $display("d = %8b(%d) + \ne = %8b(%d) = \nf = %8b(%d)",d,d,e,e,f,f);
		  $display("c)---------------------------------");
        g = 8'o34;
		  h = 8'hc;
		  h = ~h+1;
		  i = g+h;
		  
		  $display("g = %8b(%d) + \nh = %8b(%d) = \ni = %8b(%d)",g,g,h,h,i,i);
		  $display("d)");
		  j=8'hda;
		  k = 8'b10111001;
		  k = ~k+1;
		  l = j-k;
		  $display("j = %8b(%d) + \nk = %8b(%d) = \nl = %8b(%d)",j,j,k,k,l,l);
		  $display("e)-------------------------");
		  m =27;
		  n =8'h1b;
		  n = ~n+1;
		  o = m +n;
		  $display("m = %8b(%d) + \nn = %8b(%d) = \no = %8b(%d)",m,m,n,n,o,o);


end
endmodule //  teste_ex05