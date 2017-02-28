//----------------------
//Exemplo0009 - and
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
//--or gate
//----------------------

module orgate (output s, input p, input q, input r);
 assign s = p|q|r;	//criar vinculo permanente
        		   	//(dependencia)
endmodule // orgate

//----------------------
//--and gate
//----------------------

module andgate (output s, input p, input q, input r);
 assign s = (p & q & r);	//criar vinculo permanente
        		   	         //(dependencia)
endmodule // andgate

//----------------------
//--test and gate
//----------------------
module testandgate;
//----------------------dados locais
  reg a,b,c;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
  notgate NOTA(s1,a);
  notgate NOTB(s2,b);
  notgate NOTC(s3,c);
  orgate OR(s4,s1,s2,s3);
  notgate NOT(s,s4);
//---------------------- preparacao
 initial begin:start
  a=0; b=0; c=0;
 end
//---------------------- parte principal
 initial begin
   $display("Exemplo0009 - Wender Zacarias Xavier - 427472");
	$display("Test AND gate");
	$display("\na & b & c = s\n");
	$monitor("%b & %b & %b = %b",a,b,c,s);
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
		end

endmodule //testandgate


/** Resultados obtidos
   Test AND gate
    
    a & b & c = s
    
    0 & 0 & 0 = 0
    0 & 0 & 1 = 0
    0 & 1 & 0 = 0
    0 & 1 & 1 = 0
    1 & 0 & 0 = 0
    1 & 0 & 1 = 0
    1 & 1 & 0 = 0
    1 & 1 & 1 = 1
    
    						  
   **/