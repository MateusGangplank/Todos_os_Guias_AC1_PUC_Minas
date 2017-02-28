// --------------------------
// Exemplo0014 - AND
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 

// --------------------------
// -- and gate
// --------------------------
  module andgate(output s, input m,n);
     assign s=m&n;
  endmodule // andgate  
  
  
// --------------------------
// -- test and gate
// --------------------------
  module testandgate;
  

// -------------------------- dados locais
  reg  a,b,c,d;
  wire s1,s2,s3;
  
  
// -------------------------- instancia
  andgate AND1(s1,a,b);
  andgate AND2(s2,c,d);
  andgate AND3(s3,s1,s2);
  

// -------------------------- preparacao
  initial begin:start
    a=0; b=0; c=0; d=0;
  end
  

// -------------------------- parte principal
  initial begin:main
        $display("Exemplo0014 - Isabel Bicalho Amaro - 451580");
        $display("Test AND gate");
        $display("\na b (a&b) c d (c&d) = (a&b)&(c&d)\n");
		  $monitor("%b %b   %b   %b %b   %b   =  %b",a,b,s1,c,d,s2,s3);
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
 
// --    Exemplo0014 - Isabel Bicalho Amaro - 451580
// --    Test AND gate
// --    
// --    a b (a&b) c d (c&d) = (a&b)&(c&d)
// --    
// --    0 0   0   0 0   0   =  0
// --    0 0   0   0 1   0   =  0
// --    0 0   0   1 0   0   =  0
// --    0 0   0   1 1   1   =  0
// --    0 1   0   0 0   0   =  0
// --    0 1   0   0 1   0   =  0
// --    0 1   0   1 0   0   =  0
// --    0 1   0   1 1   1   =  0
// --    1 0   0   0 0   0   =  0
// --    1 0   0   0 1   0   =  0
// --    1 0   0   1 0   0   =  0
// --    1 0   0   1 1   1   =  0
// --    1 1   1   0 0   0   =  0
// --    1 1   1   0 1   0   =  0
// --    1 1   1   1 0   0   =  0
// --    1 1   1   1 1   1   =  1