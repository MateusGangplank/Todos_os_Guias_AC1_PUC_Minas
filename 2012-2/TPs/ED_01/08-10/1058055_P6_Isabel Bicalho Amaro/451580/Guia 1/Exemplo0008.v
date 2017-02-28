// --------------------------
// Exemplo0008 - XNOR
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 

// --------------------------
// -- xnor gate
// --------------------------
  module xnorgate(output s, input a,b);
    assign s=~(a^b);
  endmodule // xnorgate
  
  
// --------------------------
// -- test xnor gate
// --------------------------
  module testxnorgate;
  

// -------------------------- dados locais
  reg  a,b; // registradores
  wire s;   // conexao;


// -------------------------- instancia
  xnorgate XNOR1(s,a,b);
  

// -------------------------- preparacao
  initial begin:start
    a=0;
	 b=0;
  end
  

// -------------------------- parte principal
  initial begin:main
    $display("Exemplo0008 - Isabel Bicalho Amaro - 451580");
	 $display("Test xnor gate");
	 $display("\na  ~(a^b)  b  =  s\n");
	 $monitor("%b  ~(a^b)  %b  =  %b",a,b,s);
  #1 a=0; b=0;
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;  
  end

endmodule // testxnorgate

 // -------------------
 // -- Testes
 // -------------------
 
// --    Exemplo0008 - Isabel Bicalho Amaro - 451580
// --    Test xnor gate
// --    
// --    a  ~(a^b)  b  =  s
// --    
// --    0  ~(a^b)  0  =  1
// --    0  ~(a^b)  1  =  0
// --    1  ~(a^b)  0  =  0
// --    1  ~(a^b)  1  =  1