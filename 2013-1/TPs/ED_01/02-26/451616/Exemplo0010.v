//----
//Exemplo0010 - NOR
//Nome: Thaís Pedrosa Gomes
//Matrícula: 451616
//----

//----
//-- nor gate
//----

module norgate (output s, input p, input q);
assign s = (~p & ~q); //criar vinculo permanente
              //(dependencia)
endmodule // norgate

//----
//-- test nor gate
//----

module testnorgate;
//---- dados locais
	reg a, b; //definir registrador
	       //(variavel independente)
	wire s; //definir conexao (fio)
	        //(variavel dependente)
			  
//---- instancia
norgate NOR1 (s, a, b);

//---- preparacao
initial begin: start
  a = 0; b = 0;
  
end

//---- parte principal
initial begin: main
    //execucao unitaria
	$display("Exemplo0010 - Thais Pedrosa Gomes - 451616");
	$display("Test NOR gate.");
	$display("\n(~a & ~b)) = s\n");
	  a = 0; b = 0;
	  
#1 	$display("~( %b | %b )= %b", a, b, s);
     a = 0; b = 1;  
#1    $display("~( %b | %b )= %b", a, b, s);
     a = 1; b = 0;
#1    $display("~( %b | %b )= %b", a, b, s);
     a = 1; b = 1;
#1    $display("~( %b | %b )= %b", a, b, s);	
    	  	  
end

endmodule //testxnorgate 
	  		  			  		 			  