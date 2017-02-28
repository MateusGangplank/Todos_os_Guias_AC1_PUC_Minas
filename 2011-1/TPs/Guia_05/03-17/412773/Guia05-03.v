
//----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773
//----------------------------


//----------------------------
//------ Guia 05 - 03---------
//----------------------------


module meiasoma(s0,s1, a,b);

	output s0,s1;
	input  a, b;

	and(s0, a,b);
	xor(s1, a,b);
	
endmodule // fim meia soma

module  somacompleta(Cout, Soma, a, b, Cin);

	output Cout, Soma;
	input  a, b, Cin;
	
	wire temp1, temp2, temp3;

 	meiasoma S1 (temp1,temp2,a, b);
 	meiasoma S2(temp3, Soma, temp2, Cin);
 	or(Cout, temp1, temp3);
 

endmodule // fim somacompleta


module ProdutoCompleto3bits(s,Cout,a,b);

	output [4:0] s;
        output Cout, c;
	input [3:0] a, b;
	
	
	wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14;
	
	and(temp1, a[0], b[0]);
	and(temp2, a[1], b[0]);
	and(temp3, a[0], b[1]);
	and(temp4, a[2], b[0]);
	and(temp5, a[1], b[1]);
	and(temp6, a[0], b[2]);
	and(temp7, a[2], b[1]);
	and(temp8, a[1], b[2]);
	and(temp9, a[2], b[2]);
	
	meiasoma		 T1	(s[0], temp10, temp1, 0);
	somacompleta T2	(temp11, s[1], temp2, temp3, temp10);
	somacompleta T3	(c, temp12, temp4, temp5, temp6);
	meiasoma		 T4	(temp13, s[2], temp11, 12);
	somacompleta T5	(temp14, s[3], temp7, temp8, temp13);
	meiasoma		 T6	(Cout, s[4], temp9, temp14);
	
	
	
		
endmodule // fim ProdutoCompleto3bits	


module teste;

	wire [4:0] s; 
        wire Cout;
	reg  [3:0] a, b;

	ProdutoCompleto3bits P1 (s, Cout, a, b);


	initial begin: Start

                a = 3'b000; b = 3'b000;
	end
	
	initial begin: Principal
	
		$display("\n Guia 05 - 03 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n PRODUTO COMPLETO COM 3 BITS");
		$display("\n A * B =  s2 s1 s0 \n");


		$monitor(" %3b x %3b = %3b", a, b, s);
		
		for(a = 0; a <= 7; a =  a + 1)
		  begin
		    
  #1      $monitor(" %3b x %3b = %3b", a, b, s);
			 for(b = 0; b <= 7; b = b + 1)
			   begin

  #1              $monitor(" %3b x %3b = %3b", a, b, s);
		      end
		  	 end
  		  end
		
	
	
	 
endmodule // fim teste



