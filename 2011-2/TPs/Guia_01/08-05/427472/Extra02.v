//----------------------
//Extra02 - circ
//Nome:Wender Zacarias Xavier
//Matrícula:427472
//----------------------

//----------------------
//--or gate
//----------------------

module orgate (output s, input p, input q);
 assign s = p|q;	//criar vinculo permanente
        		   	//(dependencia)
endmodule // orgate


//----------------------
//--Circuito
//----------------------
module circ;
//----------------------dados locais
  reg a,b,c,d,e,f,g,h;    //definir registrador
  				//(variavel independente)
  wire s;	// definir conexao(fio)
   			//(variavel dependente)
//---------------------- instancia
    orgate OR1(s1,a,b);
	 orgate OR2(s2,c,d);
	 orgate OR3(s3,e,f);
	 orgate OR4(s4,g,h);
	 orgate OR5(s5,s1,s2);
	 orgate OR6(s6,s3,s4);
	 orgate OR7(s,s5,s6);
  
//---------------------- preparacao
 initial begin:start
  a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
 end
//---------------------- parte principal
 initial begin
   $display("Extra02 - Wender Zacarias Xavier - 427472");
	$display("Test Circuito");
	$display("\na b c d e f g h = s\n");
	$monitor("%b %b %b %b %b %b %b %b = %b",a,b,c,d,e,f,g,h,s);
#1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
#1 a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=1;
#1 a=0; b=0; c=0; d=0; e=0; f=0; g=1; h=0;
#1 a=0; b=0; c=0; d=0; e=0; f=1; g=0; h=0;
#1 a=0; b=0; c=0; d=0; e=1; f=0; g=0; h=0;
#1 a=0; b=0; c=0; d=1; e=0; f=0; g=0; h=0;
#1 a=0; b=0; c=1; d=0; e=0; f=0; g=0; h=0;
#1 a=0; b=1; c=0; d=0; e=0; f=0; g=0; h=0;
#1 a=1; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
		end

endmodule //circ


/** Resultados obtidos
   Test Circuito
    
    a b c d e f g h = s
    
    0 0 0 0 0 0 0 0 = 0
    0 0 0 0 0 0 0 1 = 1
    0 0 0 0 0 0 1 0 = 1
    0 0 0 0 0 1 0 0 = 1
    0 0 0 0 1 0 0 0 = 1
    0 0 0 1 0 0 0 0 = 1
    0 0 1 0 0 0 0 0 = 1
    0 1 0 0 0 0 0 0 = 1
    1 0 0 0 0 0 0 0 = 1
    
    						  
   **/