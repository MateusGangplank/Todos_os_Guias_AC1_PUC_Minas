// --------------------------
// Exemplo0002 - NOT
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------
 
 
// -------------------------- 
// -- not gate
// -------------------------- 
module notgate( output s, input p );
 assign s=~p;

endmodule // notgate


// --------------------------
// -- test not gate
// --------------------------
module testnotgate;


// -------------------------- dados locais
reg  a; // defirnir registrador
        // (variavel independente)
wire s; // definir conexao(fio)
        // (variavel dependente)
		  

// -------------------------- instancia
notgate NOT1(s,a);

// -------------------------- preparacao
initial begin:start
   a=0; // valor inicial
end


// -------------------------- parte principal
 initial begin:main
           // execucao unitaria
	  $display("Exemplo0002 - Isabel Bicalho Amaro - 451580");
	  $display("Test NOT gate");
	  $display("\n~a = s\n");
	   a=0;
 #1  $display("~%b = %b",a,s);
      a=1;
 #1  $display("~%b = %b",a,s);
 end
 
endmodule // testnotgate
 
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