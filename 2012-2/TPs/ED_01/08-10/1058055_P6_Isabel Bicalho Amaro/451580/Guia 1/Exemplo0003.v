// --------------------------
// Exemplo0003 - AND
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 
 
// --------------------------
// -- and gate
// --------------------------
module andgate(output s,input p,input q);
 assign s = p & q;
endmodule // andgate


// --------------------------
// -- test and gate
// --------------------------
module testandgate;

// -------------------------- dados locais
 reg  a,b; // definir registradores
 wire s;   // definir conexao(fio)
 
// -------------------------- instancia
 andgate AND1(s,a,b);
 
// -------------------------- preparacao
 initial begin:start
              // atribuicao simultanea
				  // dos valores iniciais
 a=0; b=0;
 end
 
 
// -------------------------- parte principal
initial begin
      $display("Exemplo0003 - Isabel Bicalho Amaro");
		$display("Test AND gate");
		$display("\na & b = s\n");
		 a=0; b=0;
#1    $display("%b & %b = %b",a,b,s);
       a=0; b=1;
#1    $display("%b & %b = %b",a,b,s);
       a=1; b=0;
#1    $display("%b & %b = %b",a,b,s);
       a=1; b=1;
#1    $display("%b & %b = %b",a,b,s);
 end
 
 endmodule // testandgate
 
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
    
// --  a & b = s
    
// --  0 & 0 = 0
// --  0 & 1 = 0
// --  1 & 0 = 0
// --  1 & 1 = 1