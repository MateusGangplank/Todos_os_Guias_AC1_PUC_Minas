//----------------------
//Exemplo0006 - nand
//Nome:Wender Zacarias Xavier
//Matrícula:427472
//----------------------

//----------------------
//--nand gate
//----------------------

module nandgate (output s, input p, input q);
 assign s = (~(p&q));	//criar vinculo permanente
        		   	//(dependencia)
endmodule // nandgate

//----------------------
//--test nand gate
//----------------------
module testnandgate;
//----------------------dados locais
  reg a,b;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
  nandgate NAND1(s,a,b);
//---------------------- preparacao
 initial begin:start
  a=0; b=0;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0006 - Wender Zacarias Xavier - 427472");
	$display("Test NAND gate");
	$display("\n~(a & b) = s\n");
	a=0; b=0;
#1	$display("~(%b & %b) = %b",a,b,s);
	a=1; b=0; 
#1 $display("~(%b & %b) = %b",a,b,s);
	a=0; b=1;
#1 $display("~(%b & %b) = %b",a,b,s);
	a=1; b=1;
#1 $display("~(%b & %b) = %b",a,b,s);
		end

endmodule //testnandgate


/** Resultados obtidos
  Test NAND gate
    
    ~(a & b) = s
    
    ~(0 & 0) = 1
    ~(1 & 0) = 1
    ~(0 & 1) = 1
    ~(1 & 1) = 0
    
    						  
   **/ 