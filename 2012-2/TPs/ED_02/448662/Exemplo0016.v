// ---------------
// Exemplo0016 - BASE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// test operacoes
// ----------------
module operacoes_01;

// ---------------- Definir dados
 reg [1:0]a;
 reg [2:0]b;
 reg [3:0]c;
 reg [4:0]d;
 reg [4:0]d2;
 reg [5:0]e;
 
 
 
// ----------------- Parte principal
 initial begin: main
   $display("Exemplo0016 - Josemar Alves Caetano - 448662");
	$display("Teste de operações.");
	
    a = 2;
	 c = 14;
	 d = a + c;
	$display("\na.)"); 
	$display("%d + %d = %b", a, c, d);
	
	 a = 3;
	 c = 9;
	 d = a * c;
	$display("\nb.)"); 
	$display("%d * %d = %b", a, c, d);
	
	 e = 32;
	 c = 5;
	 b = e / c;
	$display("\nc.)"); 
	$display("%d / %d = %b", e, c, b);
	
	 c = 2;
	 b = 6;
	 d = 7;
	 a = 1;
	 d2 = (c * b) + d - a;
	$display("\nd.)"); 
	$display("((%d * %d) + %d - %d = %b", c, b, d, a, d2);
	
	 

  end //main
  
endmodule //operacoes_01
	
	