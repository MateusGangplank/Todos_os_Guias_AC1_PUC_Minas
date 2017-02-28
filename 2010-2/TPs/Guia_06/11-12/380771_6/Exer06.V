//
// AC 1 - 2010
// TP 6
// Nome:Igor Rodrigues de Oliveira
// Matricula: 380771
//

module meia_soma (s0, s1, a, b);
	
	input   a, b;
	output s0, s1;
	
			
	xor XOR1(s0,a, b);
	and AND1(s1, a, b);
	
endmodule 




module soma_completa_1bit (s0, s1, a, b, c);
	
		
	
	input   a, b, c;
	output s0, s1;
	
	wire sa1, sa2, sa3;
	
		
	meia_soma MEIA1 (sa1, sa2, a, b);
	meia_soma MEIA2 (s0, sa3, sa1, c);
	or OR1 (s1, sa2, sa3);
	
endmodule




module soma_completa_4bit (s0, s1, s2, s3, auxCR, auxOVR, a0, a1, a2, a3, b0, b1, b2, b3);
	
	
	
	input   a0, a1, a2, a3, b0, b1, b2, b3;
	output s0, s1, s2, s3, auxCR, auxOVR;
	
	wire sa1, sa2, sa3;
	
			
	soma_completa_1bit SC1(s0, sa1, a0, b0, 0);
	soma_completa_1bit SC2(s1, sa2, a1, b1, sa1);
	soma_completa_1bit SC3(s2, sa3, a2, b2, sa2);
	soma_completa_1bit SC4(s3, auxCR, a3, b3, sa3);
	
	not NOT1(auxOVR, sa3);
	
endmodule 




module soma_ovr_cr (s0, s1, s2, s3, CR, OVR, a0, a1, a2, a3, b0, b1, b2, b3);
	
		
	input   a0, a1, a2, a3, b0, b1, b2, b3;
	output s0, s1, s2, s3, OVR, CR;
	
	wire auxOVR;
	
			
	soma_completa_4bit SOMA (s0, s1, s2, s3, CR, auxOVR, a0, a1, a2, a3, b0, b1, b2, b3);
	
	and AND1(OVR, auxOVR, CR);
	
endmodule // soma_ovr_cr




module comparador_log (s, a0, a1, a2, a3, b0, b1, b2, b3);
	
		input a0, a1, a2, a3, b0, b1, b2, b3;
		output s;
		
		wire sa1, sa2, sa3, sa4;
		
		xor XOR1(sa1, a0, b0);
		xor XOR2(sa2, a1, b1);
		xor XOR3(sa3, a2, b2);
		xor XOR4(sa4, a3, b3);
		
		or OR1(s, sa1, sa2, sa3, sa4);
	
endmodule 





module complemento_1 (s0, s1, s2, s3, a0, a1, a2, a3);
	
		input a0, a1, a2, a3;
		output s0, s1, s2, s3;
		
		not NOT1(s0, a0);
		not NOT2(s1, a1);
		not NOT3(s2, a2);
		not NOT4(s3, a3);
	
endmodule 




module zero (s, a, b);
	
		input [3:0] a, b;
		output s;

		nor N1(s, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0]);
	
endmodule



module meiaDiferenca(s0, s1, a, b);

	input a,b;
	output s0, s1;
	
	wire sa1;

	xor XOR1(s0, a, b);
	
	not NOT1(sa1, a);
	
	and AND1(s1, sa1, b);

endmodule 



module diferencaCompleta(s3, s5, a, b, c);

	input a, b, c;
	output s3, s5;
	wire s1, s0;

	meiaDiferenca MEIASOMA1(s0, s1, a, b);
	meiaDiferenca MEIASOMA2(s3, s4, s0, c);
	or OR1(s5, s1, s4);

endmodule 




module subtrator (s, a, b);
	
		input [3:0] a, b;
		output [4:0] s;

		wire st1, st2, st3;

	diferencaCompleta D1(s[0], st1, a[0], b[0], 0);
	diferencaCompleta D2(s[1], st2, a[1], b[1], st1);
	diferencaCompleta D3(s[2], st3, a[2], b[2], st2);
	diferencaCompleta D4(s[3], s[4], a[3], b[3], st3);
	
endmodule





module teste_guia_06;

	reg [3:0] a, b;
	
	wire [3:0] s, sA, sB;
	wire [4:0] sS;
	wire cr, ovr, sL, zero;
	
			
	soma_ovr_cr SOMA (s[0], s[1], s[2], s[3], cr, ovr, a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3]);
	
	comparador_log COMPA1 (sL, a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3]);
	
	complemento_1 COMP1 (sA[0], sA[1], sA[2], sA[3], a[0], a[1], a[2], a[3]);
	complemento_1 COMP2 (sB[0], sB[1], sB[2], sB[3], b[0], b[1], b[2], b[3]);
	
	zero ZERO1 (zero, a, b);
	
	subtrator SUB (sS, a, b);
	

	

		
	initial begin
	
	 $display("Igor Rodrigues de Oliveira - 380771");
      $display("Guia 6");
		$display("AC - 2010");

		$monitor("\n\nA = %4b\nB = %4b \nDiferente: %b\nSomado: %b%b%b%b\nZero: %b\nOverFlow: %b\nCarry: %b\nComplemento de A: %4b\nComplemento de B: %4b\nSubtraido: %b%b%b%b\nA < B: %b",a , b, sL, s[3], s[2], s[1], s[0], zero, ovr, cr, sA, sB, sS[3], sS[2], sS[1], sS[0], sS[4]);

       a=0; b=0;
		#1 a=1; b=0;
		#1 a=2; b=0;
		#1 a=3; b=0;
		#1 a=4; b=0;
		#1 a=5; b=0;
		#1 a=6; b=0;
		#1 a=7; b=0;
		#1 a=-1; b=0;
		#1 a=-2; b=0;
		#1 a=-3; b=0;
		#1 a=-4; b=0;
		#1 a=-5; b=0;
		#1 a=-6; b=0;
		#1 a=-7; b=0;
		#1 a=-8; b=0;

		#1 a=0; b=1;
		#1 a=1; b=1;
		#1 a=2; b=1;
		#1 a=3; b=1;
		#1 a=4; b=1;
		#1 a=5; b=1;
		#1 a=6; b=1;
		#1 a=7; b=1;
		#1 a=-1; b=1;
		#1 a=-2; b=1;
		#1 a=-3; b=1;
		#1 a=-4; b=1;
		#1 a=-5; b=1;
		#1 a=-6; b=1;
		#1 a=-7; b=1;
		#1 a=-8; b=1;

		#1 a=0; b=2;
		#1 a=1; b=2;
		#1 a=2; b=2;
		#1 a=3; b=2;
		#1 a=4; b=2;
		#1 a=5; b=2;
		#1 a=6; b=2;
		#1 a=7; b=2;
		#1 a=-1; b=2;
		#1 a=-2; b=2;
		#1 a=-3; b=2;
		#1 a=-4; b=2;
		#1 a=-5; b=2;
		#1 a=-6; b=2;
		#1 a=-7; b=2;
		#1 a=-8; b=2;
		
		#1 a=0; b=3;
		#1 a=1; b=3;
		#1 a=2; b=3;
		#1 a=3; b=3;
		#1 a=4; b=3;
		#1 a=5; b=3;
		#1 a=6; b=3;
		#1 a=7; b=3;
		#1 a=-1; b=3;
		#1 a=-2; b=3;
		#1 a=-3; b=3;
		#1 a=-4; b=3;
		#1 a=-5; b=3;
		#1 a=-6; b=3;
		#1 a=-7; b=3;
		#1 a=-8; b=3;

		#1 a=0; b=4;
		#1 a=1; b=4;
		#1 a=2; b=4;
		#1 a=3; b=4;
		#1 a=4; b=4;
		#1 a=5; b=4;
		#1 a=6; b=4;
		#1 a=7; b=4;
		#1 a=-1; b=4;
		#1 a=-2; b=4;
		#1 a=-3; b=4;
		#1 a=-4; b=4;
		#1 a=-5; b=4;
		#1 a=-6; b=4;
		#1 a=-7; b=4;
		#1 a=-8; b=4;
		
		#1 a=0; b=5;
		#1 a=1; b=5;
		#1 a=2; b=5;
		#1 a=3; b=5;
		#1 a=4; b=5;
		#1 a=5; b=5;
		#1 a=6; b=5;
		#1 a=7; b=5;
		#1 a=-1; b=5;
		#1 a=-2; b=5;
		#1 a=-3; b=5;
		#1 a=-4; b=5;
		#1 a=-5; b=5;
		#1 a=-6; b=5;
		#1 a=-7; b=5;
		#1 a=-8; b=5;

		#1 a=0; b=6;
		#1 a=1; b=6;
		#1 a=2; b=6;
		#1 a=3; b=6;
		#1 a=4; b=6;
		#1 a=5; b=6;
		#1 a=6; b=6;
		#1 a=7; b=6;
		#1 a=-1; b=6;
		#1 a=-2; b=6;
		#1 a=-3; b=6;
		#1 a=-4; b=6;
		#1 a=-5; b=6;
		#1 a=-6; b=6;
		#1 a=-7; b=6;
		#1 a=-8; b=6;
		
		#1 a=0; b=7;
		#1 a=1; b=7;
		#1 a=2; b=7;
		#1 a=3; b=7;
		#1 a=4; b=7;
		#1 a=5; b=7;
		#1 a=6; b=7;
		#1 a=7; b=7;
		#1 a=-1; b=7;
		#1 a=-2; b=7;
		#1 a=-3; b=7;
		#1 a=-4; b=7;
		#1 a=-5; b=7;
		#1 a=-6; b=7;
		#1 a=-7; b=7;
		#1 a=-8; b=7;
		
		#1 a=0; b=-1;
		#1 a=1; b=-1;
		#1 a=2; b=-1;
		#1 a=3; b=-1;
		#1 a=4; b=-1;
		#1 a=5; b=-1;
		#1 a=6; b=-1;
		#1 a=7; b=-1;
		#1 a=-1; b=-1;
		#1 a=-2; b=-1;
		#1 a=-3; b=-1;
		#1 a=-4; b=-1;
		#1 a=-5; b=-1;
		#1 a=-6; b=-1;
		#1 a=-7; b=-1;
		#1 a=-8; b=-1;
		
		
				
	end

endmodule 
