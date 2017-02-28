//----------------------
//Exemplo0008 - xnor
//Nome:Wender Zacarias Xavier
//Matrícula:427472
//----------------------

//----------------------
//--xnor gate
//----------------------

module xnorgate (output s, input p, input q);
 assign s = (~(p^q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // xnorgate

//----------------------
//--test xnor gate
//----------------------
module testxnorgate;
//----------------------dados locais
  reg a,b;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
  xnorgate XNOR(s,a,b);
//---------------------- preparacao
 initial begin:start
  a=0; b=0;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0008 - Wender Zacarias Xavier - 427472");
	$display("Test XNOR gate");
	$display("\n~(a ^ b) = s\n");
	$monitor("~(%b ^ %b) = %b",a,b,s);
#1 a=0; b=0;
#1 a=1; b=0;
#1 a=0; b=1;
#1 a=1; b=1;
		end

endmodule //testxnorgate


/** Resultados obtidos
   Test XNOR gate
    
    ~(a ^ b) = s
    
    ~(0 ^ 0) = 1
    ~(1 ^ 0) = 0
    ~(0 ^ 1) = 0
    ~(1 ^ 1) = 1
    
    						  
   **/ 