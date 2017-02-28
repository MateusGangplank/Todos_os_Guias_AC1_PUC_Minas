// --------------------------
// Exemplo0013 - AND
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 

// --------------------------
// -- and gate
// --------------------------
  module andgate(output s, input a,b,c,d);
     assign s=a&b&c&d;
  endmodule // andgate  
  
  
// --------------------------
// -- test and gate
// --------------------------
  module testandgate;
  

// -------------------------- dados locais
  reg  a,b,c,d;
  wire s;
  
  
// -------------------------- instancia
  andgate AND1(s,a,b,c,d);
  

// -------------------------- preparacao
  initial begin:start
    a=0; b=0; c=0; d=0;
  end
  

// -------------------------- parte principal
  initial begin:main
        $display("Exemplo0013 - Isabel Bicalho Amaro - 451580");
        $display("Test AND gate");
        $display("\na  b  c  d  (a & b & c & d) = s\n");
		  $monitor("%b  %b  %b  %b  (a & b & c & d) = %b",a,b,c,d,s);
  #1 a=0; b=0; c=0; d=0;              
  #1 a=0; b=0; c=0; d=1;
  #1 a=0; b=0; c=1; d=0;
  #1 a=0; b=0; c=1; d=1;
  #1 a=0; b=1; c=0; d=0;
  #1 a=0; b=1; c=0; d=1;
  #1 a=0; b=1; c=1; d=0;
  #1 a=0; b=1; c=1; d=1;
  #1 a=1; b=0; c=0; d=0;              
  #1 a=1; b=0; c=0; d=1;
  #1 a=1; b=0; c=1; d=0;
  #1 a=1; b=0; c=1; d=1;
  #1 a=1; b=1; c=0; d=0;
  #1 a=1; b=1; c=0; d=1;
  #1 a=1; b=1; c=1; d=0;
  #1 a=1; b=1; c=1; d=1;
  end
  
endmodule // testandgate

 // -------------------
 // -- Testes
 // -------------------
 
// --    Exemplo0013 - Isabel Bicalho Amaro - 451580
// --    Test AND gate
// --    
// --    a  b  c  d  (a & b & c & d) = s
// --    
// --    0  0  0  0  (a & b & c & d) = 0
// --    0  0  0  1  (a & b & c & d) = 0
// --    0  0  1  0  (a & b & c & d) = 0
// --    0  0  1  1  (a & b & c & d) = 0
// --    0  1  0  0  (a & b & c & d) = 0
// --    0  1  0  1  (a & b & c & d) = 0
// --    0  1  1  0  (a & b & c & d) = 0
// --    0  1  1  1  (a & b & c & d) = 0
// --    1  0  0  0  (a & b & c & d) = 0
// --    1  0  0  1  (a & b & c & d) = 0
// --    1  0  1  0  (a & b & c & d) = 0
// --    1  0  1  1  (a & b & c & d) = 0
// --    1  1  0  0  (a & b & c & d) = 0
// --    1  1  0  1  (a & b & c & d) = 0
// --    1  1  1  0  (a & b & c & d) = 0
// --    1  1  1  1  (a & b & c & d) = 1