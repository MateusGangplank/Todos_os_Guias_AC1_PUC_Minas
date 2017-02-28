//----------------------
//Exemplo0003 - AND
//Nome:Wender Zacarias Xavier
//Matrícula:427472
//----------------------

//----------------------
//--and gate
//----------------------

module andgate (output s, input p, input q);
 assign s = p&q;	//criar vinculo permanente
        		   	//(dependencia)
endmodule // andgate

//----------------------
//--test and gate
//----------------------
module testandgate;
//----------------------dados locais
  reg a,b;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
  andgate AND1(s,a,b);
//---------------------- preparacao
 initial begin:start
  a=0; b=0;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0002 - Wender Zacarias Xavier - 427472");
	$display("Test AND gate");
	$display("\na & b = s\n");
	a=0;b=0;
#1 $display("%b & %b = %b",a,b,s);
	a=0;b=1;
#1	$display("%b & %b = %b",a,b,s);
	a=1;b=0;
#1 $display("%b & %b = %b",a,b,s);
	a=1;b=1;
#1 $display("%b & %b = %b",a,b,s);		
		end

endmodule //testandgate


/** Resultados obtidos
	Test AND gate
    
    a & b = s
    
    0 & 0 = 0
    0 & 1 = 0
    1 & 0 = 0
    1 & 1 = 1

    						  
   **/ 