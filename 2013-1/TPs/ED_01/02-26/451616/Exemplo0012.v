//----
//Exemplo0012 - XNOR
//Nome: Thaís Pedrosa Gomes
//Matrícula: 451616
//----

//----
//-- xnor gate
//----

module xnorgate (output s, input p, input q);
assign s = p&q | ~p&~q; //criar vinculo permanente
              //(dependencia)
endmodule // xnorgate

//----
//-- test xnor gate
//----

module testxnorgate;
//---- dados locais
	reg a, b; //definir registrador
	       //(variavel independente)
	wire s; //definir conexao (fio)
	        //(variavel dependente)
			  
//---- instancia
xnorgate XNOR1 (s, a, b);

//---- preparacao
initial begin: start
  a = 0; b = 0;
  
end

//---- parte principal
initial begin: main
    //execucao unitaria
	$display("Exemplo0012 - Thais Pedrosa Gomes - 451616");
	$display("Test XNOR gate.");
	$display("\n(a&b | ~a&~b)) = s\n");
   $monitor("%b ^ %b = %b", a, b, s);
#1 a = 0; b = 0;      
#1 a = 0; b = 1;    
#1 a = 1; b = 0;    
#1 a = 1; b = 1;
    	  	  
end


endmodule //testxnorgate 
	  		  			  		