// --------------------------
// Exemplo0010 - NOR
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 

// --------------------------
// -- nor gate
// --------------------------
  module norgate(output s, input a,b);
    assign s=~a&~b;
  endmodule // norgate
   

// --------------------------
// -- test nor gate
// --------------------------
  module testnorgate;


// -------------------------- dados locais
  reg  a,b; // definir registrador
  wire s;   // definir conexao(fio)


// -------------------------- instancia
  norgate NOR1(s,a,b);


// -------------------------- preparacao
  initial begin:start
        a=0;
		  b=0;
  end
  
  
// -------------------------- parte principal
  initial begin:main
        $display("Exemplo0010 - Isabel Bicalho Amaro - 451580");
        $display("Test nor gate");
        $display("\na  ~a&~b  b  =  s\n");
		  $monitor("%b  ~a&~b  %b  =  %b",a,b,s);
  #1 a=0; b=0;              
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;
  end
  
endmodule // testnorgate

 // -------------------
 // -- Testes
 // -------------------
 
// --    Exemplo0010 - Isabel Bicalho Amaro - 451580
// --    Test nor gate
// --    
// --    a  ~a&~b  b  =  s
// --    
// --    0  ~a&~b  0  =  1
// --    0  ~a&~b  1  =  0
// --    1  ~a&~b  0  =  0
// --    1  ~a&~b  1  =  0