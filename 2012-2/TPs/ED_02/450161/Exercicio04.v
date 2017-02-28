// -------------------------
// Exercicio4
// Nome: Guilherme alves	
// Matricula: 450161
// -------------------------
// -------------------------
//  Exercicio4
// -------------------------
module teste_ex04;
// ------------------------- definir dados
// ------Dados questao a com os bits nessessarios    
	  
	  reg [8:0] a;
     reg [7:0] b;
     reg [6:0] c;
	  reg [5:0] d;
     reg [8:0] e;
    


// ------------------------- parte principal
initial begin
      $display("Exercicio04 - Guilherme Alves Oliveira - 450161");
      $display("complemento de 2");
         
        $display("letra a)---------------------");
		  
		  a = 8'b101011
;
		  a = ~a + 1;
        $display("a = %8b(%d) ",a,a);
		  $display("b)----------------------------");
		  b = 321;
		  b = ~b + 1;
		  $display("b = %6b(%d) ",b,b);
		  $display("c)----------------------------");
		  c = 27;
		  c = ~c+1;
		  $display("a = %6b(%d) ",c,c);
		  $display("d)----------------------------");
		  d = 5'hc;
		  d = ~d + 1;
		  $display("d = %6b(%d) ",d,d);
		  $display("e)----------------------------");
		  e = 8'o21;
		  e = ~e+1;
		  $display("e = %6b(%d) ",e,e);
		  
		  
end
endmodule //  teste_ex04