//----------------------
//Exemplo0001 - NOT
//Nome:Wender Zacarias Xavier
//Matrícula:427472
//----------------------

//----------------------
//--not gate
//----------------------

module notgate (output s, input p);
 assign s = ~p;//criar vinculo permanente
        		   //(dependencia)
endmodule // notgate

//----------------------
//--test notgate
//----------------------
module testnotgate;
//----------------------dados locais
  reg a;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
  notgate NOT1(s,a);
//---------------------- preparacao
 initial begin:start
  a=0;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0002 - Wender Zacarias Xavier - 427472");
	$display("Test NOT gate");
	$display("\n~a = s\n");
	a=0;
#1 $display("~%b = %b",a,s);
	a=1;
#1	$display("~%b = %b",a,s);		
		end

endmodule //testnotgate


/** Resultados obtidos
							Test NOT gate
    
    							~a = s
    
    							~0 = 1
    							~1 = 0
    						  
   **/ 