// -------------------------
// Exercicio3 
// Nome: Guilherme alves	
// Matricula: 450161
// -------------------------
// -------------------------
//  Exercicio3
// -------------------------
module teste_ex03;
// ------------------------- definir dados
// ------Dados questao a com os bits nessessarios    
	  
	  reg [6:0] a;
     reg [5:0] b;
     reg [6:0] c;
	  reg [5:0] d;
     reg [3:0] e;
     reg [5:0] f;


// ------------------------- parte principal
initial begin
      $display("Exercicio03 - Guilherme Alves Oliveira - 450161");
      $display("complemento de 2");
         
        $display("letra a)---------------------");
		  
		  a = 6'b100110;
		  a = ~a + 1;
        $display("a = %6b(%d) ",a,a);
		  $display("b)----------------------------");
		  b = 5'o24;
		  b = ~b + 1;
		  $display("b = %6b(%d) ",b,b);
		  $display("c)----------------------------");
		  c = 25;
		  c = ~c+1;
		  $display("a = %6b(%d) ",c,c);
		  $display("d)----------------------------");
		  d = 6'h2d;
		  d = ~d + 1;
		  $display("d = %6b(%d) ",d,d);
		  $display("e)----------------------------");
		  e = 27-37;
		  e = ~e+1;
		  $display("e = %6b(%d) ",e,e);
		  
		  
end
endmodule //  teste_ex03