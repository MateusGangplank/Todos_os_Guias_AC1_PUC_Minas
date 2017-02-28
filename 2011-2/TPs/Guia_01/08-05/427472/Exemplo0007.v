//----------------------
//Exemplo0007 - nor
//Nome:Wender Zacarias Xavier
//Matrícula:427472
//----------------------

//----------------------
//--nor gate
//----------------------

module norgate (output s, input p, input q);
 assign s = (~(p|q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // norgate

//----------------------
//--test nor gate
//----------------------
module testnorgate;
//----------------------dados locais
  reg a,b;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
  norgate NOR(s,a,b);
//---------------------- preparacao
 initial begin:start
  a=0; b=0;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0007 - Wender Zacarias Xavier - 427472");
	$display("Test NOR gate");
	$display("\n~(a | b) = s\n");
	$monitor("~(%b | %b) = %b",a,b,s);
#1 a=0; b=0;
#1 a=1; b=0;
#1 a=0; b=1;
#1 a=1; b=1;
		end

endmodule //testnorgate


/** Resultados obtidos
   Test NOR gate
    
    ~(a | b) = s
    
    ~(0 | 0) = 1
    ~(1 | 0) = 0
    ~(0 | 1) = 0
    ~(1 | 1) = 0
    
    						  
   **/ 