// --------------------------
// Exemplo0011 - XOR
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 

// --------------------------
// -- xor gate
// --------------------------
  module xorgate(output s, input a,b);
     assign s=(~a&b)|(a&~b);
  endmodule // xorgate  
  
  
// --------------------------
// -- test xor gate
// --------------------------
  module testxorgate;
  

// -------------------------- dados locais
  reg  a,b;
  wire s;
  
  
// -------------------------- instancia
  xorgate XOR(s,a,b);
  

// -------------------------- preparacao
  initial begin:start
    a=0; b=0;
  end
  

// -------------------------- parte principal
  initial begin:main
        $display("Exemplo0011 - Isabel Bicalho Amaro - 451580");
        $display("Test xor gate");
        $display("\na  (~a&b)|(a&~b)  b  =  s\n");
		  $monitor("%b  (~a&b)|(a&~b)  %b  =  %b",a,b,s);
  #1 a=0; b=0;              
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;
  end
  
endmodule // testxorgate

 // -------------------
 // -- Testes
 // -------------------
 
// --    Exemplo0011 - Isabel Bicalho Amaro - 451580
// --    Test xor gate
// --    
// --    a  (~a&b)|(a&~b)  b  =  s
// --    
// --    0  (~a&b)|(a&~b)  0  =  0
// --    0  (~a&b)|(a&~b)  1  =  1
// --    1  (~a&b)|(a&~b)  0  =  1
// --    1  (~a&b)|(a&~b)  1  =  0