//----
//Exemplo0015 - OR
//Nome: Thaís Pedrosa Gomes
//Matrícula: 451616
//----

//----
//-- or gate
//----

module orgate (output s, input p, q);
assign s = (p|q); //criar vinculo permanente
              //(dependencia)
endmodule // orgate

module orgate2 (output s, input p, q, r);
wire s1;
orgate OR1 (s1, p, q);
orgate OR2 (s, r, s1);
endmodule //orgate


//----
//-- test or gate
//----

module testorgate;
//---- dados locais
	reg a, b, c; //definir registrador
	       //(variavel independente)
	wire s; //definir conexao (fio)
	        //(variavel dependente)

//---- instancia			  
orgate2 OR3(s, a, b, c);

//---- preparacao
initial begin: start
  a = 0; b = 0; c = 0;
  
end

//---- parte principal
initial begin: main
    //execucao unitaria
	$display("Exemplo0015 - Thais Pedrosa Gomes - 451616");
	$display("Test OR gate.");
	$display("\n(a&b)&c = s\n");
	
	$monitor("(%b | %b) | %b = %b", a, b, c, s);
#1 a = 0; b = 0; c = 0;
#1 a = 0; b = 0; c = 1;     
#1 a = 0; b = 1; c = 0;
#1 a = 0; b = 1; c = 1;  
#1 a = 1; b = 0; c = 0;
#1 a = 1; b = 0; c = 1;  
#1 a = 1; b = 1; c = 0;
#1 a = 1; b = 1; c = 1;  
    	  	  
end

endmodule //testorgate 
	  		  			  		 			  