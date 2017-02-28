//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 01 - Exemplo 003
//@Matricula: 420139
//----------------

//----------------
//-- NOR GATE ---
//----------------

module xnorgate (s1, e1, e2, e3, e4);
   output s1;
   input  e1, e2, e3, e4;
   assign s1 = ~(e1^e2^e3^e4);
endmodule


//----------------
//-- XNOR TEST ---
//----------------

module testxnorgate;
reg e1, e2, e3, e4;
wire s1;

xnorgate xnor1 (s1, e1, e2, e3, e4);

initial begin

$display("Guia 01 - Exemplo 03");
      $display("XNOR Gate");
      e4=0; e1=0; e2=0; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=0; e1=0; e2=0; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=0; e1=0; e2=1; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=0; e1=0; e2=1; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
 		e4=0; e1=1; e2=0; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
 		e4=0; e1=1; e2=0; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=0; e1=1; e2=1; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
 		e4=0; e1=1; e2=1; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
      e4=1; e1=0; e2=0; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=1; e1=0; e2=0; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=1; e1=0; e2=1; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=1; e1=0; e2=1; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
 		e4=1; e1=1; e2=0; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
 		e4=1; e1=1; e2=0; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
  		e4=1; e1=1; e2=1; e3=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
 		e4=1; e1=1; e2=1; e3=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", e4, e1, e2, e3, s1);
	 
  
end
	
endmodule

//--- TESTES -----
//---    Guia 01 - Exemplo 03
//---    XNOR Gate
//---    ~(0 ^ 0 ^ 0 ^ 0) = 1
//---    ~(0 ^ 0 ^ 0 ^ 1) = 0
//---    ~(0 ^ 0 ^ 1 ^ 0) = 0
//---    ~(0 ^ 0 ^ 1 ^ 1) = 1
//---    ~(0 ^ 1 ^ 0 ^ 0) = 0
//---    ~(0 ^ 1 ^ 0 ^ 1) = 1
//---    ~(0 ^ 1 ^ 1 ^ 0) = 1
//---    ~(0 ^ 1 ^ 1 ^ 1) = 0
//---    ~(1 ^ 0 ^ 0 ^ 0) = 0
//---    ~(1 ^ 0 ^ 0 ^ 1) = 1
//---    ~(1 ^ 0 ^ 1 ^ 0) = 1
//---    ~(1 ^ 0 ^ 1 ^ 1) = 0
//---    ~(1 ^ 1 ^ 0 ^ 0) = 1
//---    ~(1 ^ 1 ^ 0 ^ 1) = 0
//---    ~(1 ^ 1 ^ 1 ^ 0) = 0
//---    ~(1 ^ 1 ^ 1 ^ 1) = 1