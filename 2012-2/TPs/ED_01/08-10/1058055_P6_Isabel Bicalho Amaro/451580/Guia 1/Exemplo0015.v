// --------------------------
// Exemplo0015 - OR
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 

// --------------------------
// -- or gate
// --------------------------
  module orgate(output s, input m,n);
     assign s=m|n;
  endmodule // orgate  
  
  
// --------------------------
// -- test or gate
// --------------------------
  module testorgate;
  

// -------------------------- dados locais
  reg  a,b,c,d;
  wire s1,s2,s3;
  
  
// -------------------------- instancia
  orgate OR1(s1,a,b);
  orgate OR2(s2,c,d);
  orgate OR3(s3,s1,s2);
  

// -------------------------- preparacao
  initial begin:start
    a=0; b=0; c=0; d=0;
  end
  

// -------------------------- parte principal
  initial begin:main
        $display("Exemplo0015 - Isabel Bicalho Amaro - 451580");
        $display("Test OR gate");
        $display("\na b (a|b) c d (c|d) = (a|b)|(c|d)\n");
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
  
endmodule // testorgate

 // -------------------
 // -- Testes
 // -------------------
 
// --    Exemplo0015 - Isabel Bicalho Amaro - 451580
// --    Test OR gate
// --    
// --    a b (a|b) c d (c|d) = (a|b)|(c|d)
// --    
// --    0 0   0   0 0   0   =  0
// --    0 0   0   0 1   1   =  1
// --    0 0   0   1 0   1   =  1
// --    0 0   0   1 1   1   =  1
// --    0 1   1   0 0   0   =  1
// --    0 1   1   0 1   1   =  1
// --    0 1   1   1 0   1   =  1
// --    0 1   1   1 1   1   =  1
// --    1 0   1   0 0   0   =  1
// --    1 0   1   0 1   1   =  1
// --    1 0   1   1 0   1   =  1
// --    1 0   1   1 1   1   =  1
// --    1 1   1   0 0   0   =  1
// --    1 1   1   0 1   1   =  1
// --    1 1   1   1 0   1   =  1
// --    1 1   1   1 1   1   =  1