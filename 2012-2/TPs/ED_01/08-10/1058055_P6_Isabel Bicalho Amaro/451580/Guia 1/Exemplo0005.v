// --------------------------
// Exemplo0005 - XOR
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 
 
// --------------------------
// -- xor gate
// --------------------------
module xorgate(output [0:3]s,input [0:3]p,input [0:3]q);
 assign s=p^q;
endmodule // xor
 

// --------------------------
// -- test or gate
// --------------------------
  module testxorgate;


// -------------------------- dados locais
  reg  [0:3]a,b; // definir registrador
  wire [0:3]s;   // definir conexao(fio)


// -------------------------- instancia
  xorgate XOR1(s,a,b);


// -------------------------- preparacao
  initial begin:start
        a=4'b0011; // 4 valores binarios
		  b=4'b0101; // 4 valores binarios
  end
  
  
// -------------------------- parte principal
  initial begin:main
        $display("Exemplo0005 - Isabel Bicalho Amaro - 451580");
        $display("Test xor gate");
        $display("\n a  ^  b  =  s\n");
		  $monitor(" %b  ^  %b  = %b",a,b,s);
  #1 a=0; b=0;              // valores decimais
  #1 a=4'b0010; b=4'b0001;  // valores binarios
  #1 a=4'd1; b=3;           // decimal e decimal
  #1 a=4'o5; b=2;           // octal e decimal
  #1 a=4'hA; b=3;           // hexadecimal e decimal
  #1 a=4'h9; b=4'o3;        // hexadecimal e octal
  end
  
endmodule // testxorgate

 // -------------------
 // -- Testes
 // -------------------
 
// --  Exemplo0001 - Isabel Bicalho Amaro - 451580
// --  Test buffer:
// --  	    time	      a = s
// --                0	x = x
// --                1	1 = 1
// --                3	0 = 0


// --  Exemplo0002 - Isabel Bicalho Amaro - 451580
// --  Test NOT gate
// --      
// --  ~a = s
// --     
// --  ~0 = 1
// --  ~1 = 0


// --  Exemplo0003 - Isabel Bicalho Amaro
// --  Test AND gate
// --   
// --  a & b = s
// --    
// --  0 & 0 = 0
// --  0 & 1 = 0
// --  1 & 0 = 0
// --  1 & 1 = 1


// --  Exemplo0004 - Isabel Bicalho Amaro
// --  Test OR gate
// --    
// --  a | b = s
// --    
// --  0 | 0 = 0
// --  0 | 1 = 1
// --  1 | 0 = 1
// --  1 | 1 = 1


// --  Exemplo0005 - Isabel Bicalho Amaro - 451580
// --  Test xor gate
// --    
// --   a  ^  b  =  s
// --    
// --   0011  ^  0101  = 0110
// --   0000  ^  0000  = 0000
// --   0010  ^  0001  = 0011
// --   0001  ^  0011  = 0010
// --   0101  ^  0010  = 0111
// --   1010  ^  0011  = 1001
// --   1001  ^  0011  = 1010