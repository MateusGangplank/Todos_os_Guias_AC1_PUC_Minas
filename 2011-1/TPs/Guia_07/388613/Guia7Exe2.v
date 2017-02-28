// Marden Batista, Matricula 388613


module meiaSoma (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 
 and AND1 (s1, a, b);
 xor XOR1 (s0, a, b);
 
endmodule

module complemento2 (s0, s1, s2, s3, s4, s5, a4, a3, a2, a1, a0);
 output s0, s1, s2, s3, s4, s5;
 input a4, a3, a2, a1, a0;
 wire w0, w1, w2, w3, w4, z0, z1, z2, z3;
 
 not NOT1 (w0, a0);
 not NOT2 (w1, a1);
 not NOT3 (w2, a2);
 not NOT4 (w3, a3);
 not NOT5 (w4, a4);
 meiaSoma ha1 (s0, z0, 1, w0);
 meiaSoma ha2 (s1, z1, z0, w1);
 meiaSoma ha3 (s2, z2, z1, w2);
 meiaSoma ha4 (s4, s5, z3, w4);
 meiaSoma ha5 (s3, z3, z2, w3); 
endmodule

module testComplemento2;
 reg a4, a3, a2, a1, a0;
 wire s0, s1, s2, s3, s4, s5;
 
complemento2 comp (s0, s1, s2, s3, s4, s5, a4, a3, a2, a1, a0);
 initial begin
      $display("Marden Batista - 388613");
      $display("Exe 02 - Complemento de 2");
      $display("\n a4 a3 a2 a1 a0 = s5 s4 s3 s2 s1 s0");
		$monitor(" %b  %b  %b  %b  %b =  %b  %b  %b  %b  %b  %b", a4, a3, a2, a1, a0, s5, s4, s3, s2, s1, s0);
												//Dec
	#1 a4=0; a3=0; a2=0; a1=0; a0=0; //00
	#1 a4=0; a3=0; a2=0; a1=0; a0=1; //01
	#1 a4=0; a3=0; a2=0; a1=1; a0=0; //02
	#1 a4=0; a3=0; a2=0; a1=1; a0=1; //03
	#1 a4=0; a3=0; a2=1; a1=0; a0=0; //04
	#1 a4=0; a3=0; a2=1; a1=0; a0=1; //05
	#1 a4=0; a3=0; a2=1; a1=1; a0=0; //06
	#1 a4=0; a3=0; a2=1; a1=1; a0=1; //07
	#1 a4=0; a3=1; a2=0; a1=0; a0=0; //08
	#1 a4=0; a3=1; a2=0; a1=0; a0=1; //09
	#1 a4=0; a3=1; a2=0; a1=1; a0=0; //10
	#1 a4=0; a3=1; a2=0; a1=1; a0=1; //11
	#1 a4=0; a3=1; a2=1; a1=0; a0=0; //12
	#1 a4=0; a3=1; a2=1; a1=0; a0=1; //13
	#1 a4=0; a3=1; a2=1; a1=1; a0=0; //14
	#1 a4=0; a3=1; a2=1; a1=1; a0=1; //15
	#1 a4=1; a3=0; a2=0; a1=0; a0=0; //16
	#1 a4=1; a3=0; a2=0; a1=0; a0=1; //17
	#1 a4=1; a3=0; a2=0; a1=1; a0=0; //18
	#1 a4=1; a3=0; a2=0; a1=1; a0=1; //19
	#1 a4=1; a3=0; a2=1; a1=0; a0=0; //20
	#1 a4=1; a3=0; a2=1; a1=0; a0=1; //21
	#1 a4=1; a3=0; a2=1; a1=1; a0=0; //22
	#1 a4=1; a3=0; a2=1; a1=1; a0=1; //23
	#1 a4=1; a3=1; a2=0; a1=0; a0=0; //24
	#1 a4=1; a3=1; a2=0; a1=0; a0=1; //25
	#1 a4=1; a3=1; a2=0; a1=1; a0=0; //26
	#1 a4=1; a3=1; a2=0; a1=1; a0=1; //27
	#1 a4=1; a3=1; a2=1; a1=0; a0=0; //28
	#1 a4=1; a3=1; a2=1; a1=0; a0=1; //29
	#1 a4=1; a3=1; a2=1; a1=1; a0=0; //30
	#1 a4=1; a3=1; a2=1; a1=1; a0=1; //31		
 end
 
endmodule