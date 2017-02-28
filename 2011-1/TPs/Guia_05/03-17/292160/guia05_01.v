// ---------------------
// Guia 05_01
// Nome: Luiz Menezes
// Matricula: 292160
// ---------------------

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


module SomaCompleta4bits(s,Cout,a,b);

	output [3:0] s;
        output Cout;
	input [4:0] a, b;
	
	wire temp1, temp2, temp3;
	
		
	meiasoma      S3(temp1, s[0] ,a[0], b[0]) ;
	somacompleta  S4(temp2, s[1], a[1], b[1], temp1);
	somacompleta  S5(temp3, s[2], a[2], b[2], temp2);
	somacompleta  S6(Cout , s[3], a[3], b[3], temp3);
	
endmodule // fim SomaCompleta4bits	

module teste;

	wire [3:0] s; 
        wire Cout;
	reg  [4:0] a, b;

	SomaCompleta4bits SOMA (s, Cout, a, b);


	initial begin: Start

                a = 4'b0000; b = 4'b0000;
	end
	
	initial begin: Principal
	
		$display("\n Guia 05 - 01 - Luiz Menezes - 292160");
		$display("\n SOMA COMPLETA COM 4 BITS");
		$display("\n A + B = s3 s2 s1 s0 \n");


		$monitor(" %4b + %4b = %4b", a, b, s);
		
		for(a = 0; a <= 15; a =  a + 1)
		  begin
		    
  #1      $monitor(" %4b + %4b = %4b", a, b, s);
			 for(b = 0; b <= 15; b = b + 1)
			   begin

  #1              $monitor(" %4b + %4b = %4b", a, b, s);
		      end
		  	 end
  		  end
			 
endmodule // fim teste

	
