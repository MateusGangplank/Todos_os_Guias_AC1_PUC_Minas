// --Guia 01
// --Nome: Gabriel Benjamim de Carvalho
// --Matricula: 396690


// --NAND GATE

module nandgate (s, p, q );
 output s;
 input  p, q ;

 assign s = ~(p & q );

endmodule // --NAND GATE

// -- TESTE NAND GATE


module testenandgate;
 reg   a, b;
 wire  s;

 nandgate NAND1 (s, a, b);
 
          
 initial begin
      $display("Guia 01 - Gabriel Benjamim de Carvalho - 396690");
      $display("Teste NAND gate");
      $display("\na & b = s\n");
      a=0; b=0;
  #1  $display("~(%b & %b ) = %b", a, b, s);
      a=0; b=1;
  #1  $display("~(%b & %b ) = %b", a, b, s);
      a=1; b=0;
  #1  $display("~(%b & %b ) = %b", a, b, s);
      a=1; b=1;
  #1  $display("~(%b & %b ) = %b", a, b, s);
    
 end

endmodule // testenandgate

/*
	TESTE
	
	----jGRASP exec: vvp guia01_01.vvp
    
    Guia 01 - Gabriel Benjamim de Carvalho - 396690
    Teste NAND gate
    
    a & b = s
    
    ~(0 & 0 ) = 1
    ~(0 & 1 ) = 1
    ~(1 & 0 ) = 1
    ~(1 & 1 ) = 0
    
     ----jGRASP: operation complete.



*/
