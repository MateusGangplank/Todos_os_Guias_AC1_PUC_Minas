// --------------------------
// Exemplo0006 - NAND
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 
 
// --------------------------
// -- nand gate
// --------------------------
  module nandgate(output s, input a,b);
    assign s=~(a&b);
  endmodule // nandgate
   

// --------------------------
// -- test nand gate
// --------------------------
  module testnandgate;


// -------------------------- dados locais
  reg  a,b; // definir registrador
  wire s;   // definir conexao(fio)


// -------------------------- instancia
  nandgate NAND1(s,a,b);


// -------------------------- preparacao
  initial begin:start
        a=0;
		  b=0;
  end
  
  
// -------------------------- parte principal
  initial begin:main
        $display("Exemplo0006 - Isabel Bicalho Amaro - 451580");
        $display("Test nand gate");
        $display("\na  ~(a&b)  b  =  s\n");
		  $monitor("%b  ~(a&b)  %b  =  %b",a,b,s);
  #1 a=0; b=0;              
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;
  end
  
endmodule // testnandgate

 // -------------------
 // -- Testes
 // -------------------
 
// --   Exemplo0001 - Isabel Bicalho Amaro - 451580
// --   Test buffer:
// --  	    time	      a = s
// --                0	x = x
// --                1	1 = 1
// --                3	0 = 0


// --   Exemplo0002 - Isabel Bicalho Amaro - 451580
// --   Test NOT gate
// --       
// --   ~a = s
// --      
// --   ~0 = 1
// --   ~1 = 0


// --   Exemplo0003 - Isabel Bicalho Amaro
// --   Test AND gate
// --    
// --   a & b = s
// --     
// --   0 & 0 = 0
// --   0 & 1 = 0
// --   1 & 0 = 0
// --   1 & 1 = 1


// --   Exemplo0004 - Isabel Bicalho Amaro
// --   Test OR gate
// --     
// --   a | b = s
// --     
// --   0 | 0 = 0
// --   0 | 1 = 1
// --   1 | 0 = 1
// --   1 | 1 = 1
 
 
// --   Exemplo0005 - Isabel Bicalho Amaro - 451580
// --   Test xor gate
// --     
// --    a  ^  b  =  s
// --     
// --    0011  ^  0101  = 0110
// --    0000  ^  0000  = 0000
// --    0010  ^  0001  = 0011
// --    0001  ^  0011  = 0010
// --    0101  ^  0010  = 0111
// --    1010  ^  0011  = 1001
// --    1001  ^  0011  = 1010


// --    Exemplo0006 - Isabel Bicalho Amaro - 451580
// --    Test nand gate
// --    
// --    a  ~(a&b)  b  =  s
// --    
// --    0  ~(a&b)  0  =  1
// --    0  ~(a&b)  1  =  1
// --    1  ~(a&b)  0  =  1
// --    1  ~(a&b)  1  =  0