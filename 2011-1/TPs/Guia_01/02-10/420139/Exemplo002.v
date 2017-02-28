//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 01 - Exemplo 002
//@Matricula: 420139
//----------------

//----------------
//-- NOR GATE ---
//----------------

module norgate (s1, e1, e2, e3);
   output s1;
   input  e1, e2, e3;
   assign s1 = ~((e1|e2)|e3);
endmodule


//----------------
//-- NOR TEST ---
//----------------

module testnorgate;
reg e1, e2, e3;
wire s1;

norgate nor1 (s1, e1, e2, e3);

initial begin

$display("Guia 01 - Exemplo 02");
      $display("NOR Gate");
      e1=0; e2=0; e3=0;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
  		e1=0; e2=0; e3=1;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
  		e1=0; e2=1; e3=0;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
  		e1=0; e2=1; e3=1;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
 		e1=1; e2=0; e3=0;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
 		e1=1; e2=0; e3=1;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
  		e1=1; e2=1; e3=0;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
 		e1=1; e2=1; e3=1;
  #1  $display("~(%b | %b | %b) = %b", e1, e2, e3, s1);
  
end
	
endmodule

//--- TESTES -----
//---    Guia 01 - Exemplo 02
//---    NOR Gate
//---    ~(0 | 0 | 0) = 1
//---    ~(0 | 0 | 1) = 0
//---    ~(0 | 1 | 0) = 0
//---    ~(0 | 1 | 1) = 0
//---    ~(1 | 0 | 0) = 0
//---    ~(1 | 0 | 1) = 0
//---    ~(1 | 1 | 0) = 0
//---    ~(1 | 1 | 1) = 0