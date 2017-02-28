//----
//Exemplo0013 - AND
//Nome: Thaís Pedrosa Gomes
//Matrícula: 451616
//----

//----
//-- and gate
//----

module andgate (output s, input p, q, r);
assign s = p&q&r; //criar vinculo permanente
              //(dependencia)
endmodule // andgate

//----
//-- test and gate
//----

module testandgate;
//---- dados locais
	reg a, b, c; //definir registrador
	       //(variavel independente)
	wire s; //definir conexao (fio)
	        //(variavel dependente)
			  
//---- instancia
andgate AND1 (s, a, b, c);

//---- preparacao
initial begin: start
  a = 0; b = 0; c = 0;
  
end

//---- parte principal
initial begin: main
    //execucao unitaria
	$display("Exemplo0013 - Thais Pedrosa Gomes - 451616");
	$display("Test AND gate.");
	$display("\n(a&b&c)) = s\n");
	$monitor("%b & %b & %b = %b", a, b, c, s);
#1 a = 0; b = 0; c = 0;
#1 a = 0; b = 0; c = 1;     
#1 a = 0; b = 1; c = 0;
#1 a = 0; b = 1; c = 1;  
#1 a = 1; b = 0; c = 0;
#1 a = 1; b = 0; c = 1;  
#1 a = 1; b = 1; c = 0;
#1 a = 1; b = 1; c = 1;  
    	  	  
end

endmodule //testxnorgate 
	  		  			  		 			  