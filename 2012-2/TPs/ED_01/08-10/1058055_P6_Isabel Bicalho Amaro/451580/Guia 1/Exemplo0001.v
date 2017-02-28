// --------------------------
// Exemplo0001 - buffer
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------


// --------------------------
// -- buffer
// --------------------------
module buffer (output s, input p);
 assign s = p; // criar vinculo permanente
              // (dependencia)
endmodule // buffer


// --------------------------
// -- test buffer
// --------------------------
module testbuffer;
// -------------------------- dados locais
reg  a; // definir registrador
        // variavel independente
wire s; // definir conecao (fio)
        // (variavel dependente)
		  
// -------------------------- instancia
 buffer BF1(s,a);
 
// -------------------------- parte principal
 initial begin:main
           // execucao unitaria
	  $display("Exemplo0001 - Isabel Bicalho Amaro - 451580");
	  $display("Test buffer:");
	  $display("\t    time\ta = s");
	        // execucao permanente
	  $monitor("%d\t%b = %b", $time,a,s);
	        // apos uma unidade de tempo
			  // mudar o registrador para 1
 #1 a=1;
           // apos duas unidades de tempo
			  // mudar o valor do registrador para 0
 #2 a=0;
 end
 
 endmodule // testbuffer
 
 // -------------------
 // -- Testes
 // -------------------
 
--  Exemplo0001 - Isabel Bicalho Amaro - 451580
--  Test buffer:
--  	    time	      a = s
--                0	x = x
--                1	1 = 1
--                3	0 = 0