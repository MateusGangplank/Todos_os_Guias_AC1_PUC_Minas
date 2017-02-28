//----
//Exemplo0003 - AND
//Nome: Thaís Pedrosa Gomes
//Matrícula: 451616
//----

//----
//-- and gate
//----

module andgate (output s, input p, input q);
assign s = p & q; //criar vinculo permanente
              //(dependencia)
endmodule // andgate

//----
//-- test and gate
//----

module testandgate;
//---- dados locais
	reg a, b; //definir registrador
	       //(variavel independente)
	wire s; //definir conexao (fio)
	        //(variavel dependente)
			  
//---- instancia
andgate AND1 (s, a, b);

//---- preparacao
initial begin: start
  a = 0; b = 0;//valor inicial
end

//---- parte principal
initial begin: main
    //execucao unitaria
	$display("Exemplo0003 - Thais Pedrosa Gomes - 451616");
	$display("Test AND gate.");
	$display("\na & b = s\n");
	  a = 0; b = 0;
#1 	$display("%b & %b = %b", a, b, s);
     a = 0; b = 1;  
#1    $display("%b & %b = %b", a, b, s);
     a = 1; b = 0;
#1    $display("%b & %b = %b", a, b, s);
     a = 1; b = 1;
#1    $display("%b & %b = %b", a, b, s);	  	  
end

endmodule //testandgate 
	  		  			  		 			  