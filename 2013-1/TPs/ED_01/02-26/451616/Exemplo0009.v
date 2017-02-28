//----
//Exemplo0009 - NAND
//Nome: Thaís Pedrosa Gomes
//Matrícula: 451616
//----

//----
//-- nand gate
//----

module nandgate (output s, input p, input q);
assign s = (~p | ~q); //criar vinculo permanente
              //(dependencia)
endmodule // nandgate

//----
//-- test nand gate
//----

module testnandgate;
//---- dados locais
	reg a, b; //definir registrador
	       //(variavel independente)
	wire s; //definir conexao (fio)
	        //(variavel dependente)
			  
//---- instancia
nandgate NAND1 (s, a, b);

//---- preparacao
initial begin: start
  a = 0; b = 0;
  
end

//---- parte principal
initial begin: main
    //execucao unitaria
	$display("Exemplo0009 - Thais Pedrosa Gomes - 451616");
	$display("Test NAND gate.");
	$display("\n(~a | ~b)) = s\n");
	  a = 0; b = 0;
	  
#1 	$display("~( %b & %b )= %b", a, b, s);
     a = 0; b = 1;  
#1    $display("~( %b & %b )= %b", a, b, s);
     a = 1; b = 0;
#1    $display("~( %b & %b )= %b", a, b, s);
     a = 1; b = 1;
#1    $display("~( %b & %b )= %b", a, b, s);	
    	  	  
end

endmodule //testxnorgate 
	  		  			  		 			  