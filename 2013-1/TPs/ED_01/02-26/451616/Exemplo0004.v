//----
//Exemplo0004 - OR
//Nome: Thaís Pedrosa Gomes
//Matrícula: 451616
//----

//----
//-- or gate
//----

module orgate (output s, input p, q);
assign s = p | q; //criar vinculo permanente
              //(dependencia)
endmodule // orgate

//----
//-- test or gate
//----

module testorgate;
//---- dados locais
	reg a, b; //definir registrador
	       //(variavel independente)
	wire s; //definir conexao (fio)
	        //(variavel dependente)
			  
//---- instancia
orgate OR1 (s, a, b);

//---- preparacao
initial begin: start
  a = 0; b = 0;//valor inicial
end

//---- parte principal
initial begin: main
    //execucao unitaria
	$display("Exemplo0004 - Thais Pedrosa Gomes - 451616");
	$display("Test OR gate.");
	$display("\na | b = s\n");
	  a = 0; b = 0;
#1 	$display("%b | %b = %b", a, b, s);
     a = 0; b = 1;  
#1    $display("%b | %b = %b", a, b, s);
     a = 1; b = 0;
#1    $display("%b | %b = %b", a, b, s);
     a = 1; b = 1;
#1    $display("%b | %b = %b", a, b, s);	  	  
end

endmodule //testorgate 
	  		  			  		 			  