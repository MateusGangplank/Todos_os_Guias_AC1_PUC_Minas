// --------------------------
// Exemplo0009 - NAND
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 

// --------------------------
// -- nand gate
// --------------------------
  module nandgate(output s, input a,b);
    assign s=~a|~b;
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
        $display("Exemplo0009 - Isabel Bicalho Amaro - 451580");
        $display("Test nand gate");
        $display("\na  ~a|~b  b  =  s\n");
		  $monitor("%b  ~a|~b  %b  =  %b",a,b,s);
  #1 a=0; b=0;              
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;
  end
  
endmodule // testnandgate

 // -------------------
 // -- Testes
 // -------------------
 
// --    Exemplo0009 - Isabel Bicalho Amaro - 451580
// --    Test nand gate
// --    
// --    a  ~a|~b  b  =  s
// --    
// --    0  ~a|~b  0  =  1
// --    0  ~a|~b  1  =  1
// --    1  ~a|~b  0  =  1
// --    1  ~a|~b  1  =  0