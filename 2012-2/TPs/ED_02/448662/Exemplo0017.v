// ---------------
// Exemplo0017 - BASE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// test operacoes
// ----------------
module operacoes_02;

// ---------------- Definir dados
 reg [4:0]a; reg [4:0]a2;
 reg [5:0]b; reg [5:0]b2;
 reg [6:0]c; reg [6:0]c2;
 reg [7:0]d; reg [7:0]d2;
 reg [8:0]e; reg [8:0]e2;
 reg [9:0]f; reg [9:0]f2;
 
// ----------------- Parte principal
 initial begin: main
   $display("Exemplo0017 - Josemar Alves Caetano - 448662");
	$display("Teste de operações.");
	
	 b = 6'b101010;
	 a = 5'b11011;
	 c = a + b;
	$display("a.)"); 
	$display("%b(2) + %b(2) = %b\n",b, a, c);
	 
	 a = 5'b11011;
	 b = 6'o25;
	 b2 = a + b;
	$display("b.)"); 
	$display("%b(2) + %o(8) = %b\n",a, b, b2);
   
	 f = 10'o1234;
	 d = 6'h3C;
	 f2 = f + d;
	$display("c.)"); 
	$display("%o(8) + %h(16) = %b\n",f, d, f2);
	
	 e = 9'h1ba;
	 e2 = 9'b101110001;
	 f = e + e2;
	$display("d.)"); 
	$display("%h(16) + %b(2) = %b\n",e, e2, f);
	
	 a = 5'o25;
	 a2 = 5'o32;
	 c = 7'h7a;
	 f = (a * a2) + c;
	$display("e.)"); 
	$display("(%o(8) * %o(8)) + %h(16) = %b\n",a, a2, c, f);
	
  end //main
  
endmodule //operacoes_02
	
	