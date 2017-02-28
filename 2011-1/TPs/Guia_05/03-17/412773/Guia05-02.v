
//----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773
//----------------------------


//----------------------------
//------ Guia 05 - 02---------
//----------------------------


module meiadiferenca(s0,s1, a,b);

	output s0,s1;
	input  a, b;

	and(s0, ~a,b);
	xor(s1, a,b);
	
endmodule // fim meia soma

module  diferencacompleta(Cout, Soma, a, b, Cin);

	output Cout, Soma;
	input  a, b, Cin;
	
	wire temp1, temp2, temp3;

 	meiadiferenca S1 (temp1,temp2,a, b);
 	meiadiferenca S2(temp3, Soma, temp2, Cin);
 	or(Cout, temp1, temp3);
 

endmodule // fim diferencacompleta


module DiferencaCompleta3bits(s,Cout,a,b);

	output [2:0] s;
        output Cout;
	input [3:0] a, b;
	
	wire temp1, temp2, temp3;
	
		
	meiadiferenca      S3(temp1, s[0] ,a[0], b[0]) ;
	diferencacompleta  S4(temp2, s[1], a[1], b[1], temp1);
	diferencacompleta  S5(Cout, s[2], a[2], b[2], temp2);
	
	
endmodule // fim DiferencaCompleta3bits	

module teste;

	wire [2:0] s; 
        wire Cout;
	reg  [3:0] a, b;

	DiferencaCompleta3bits SOMA (s, Cout, a, b);


	initial begin: Start

                a = 3'b000; b = 3'b000;
	end
	
	initial begin: Principal
	
		$display("\n Guia 05 - 02 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n DIFERENÇA COMPLETA COM 3 BITS");
		$display("\n A - B =  s2 s1 s0 \n");


		$monitor(" %3b - %3b = %3b", a, b, s);
		
		for(a = 0; a <= 7; a =  a + 1)
		  begin
		    
  #1      $monitor(" %3b - %3b = %3b", a, b, s);
			 for(b = 0; b <= 7; b = b + 1)
			   begin

  #1              $monitor(" %3b - %3b = %3b", a, b, s);
		      end
		  	 end
  		  end
		
	
	
	 
endmodule // fim teste

	
