// Marden Batista, Matricula: 380752

module complemento1 (s0, s1, s2, s3, s4, a4, a3, a2, a1, a0);
 output s0, s1, s2, s3, s4;
 input a4, a3, a2, a1, a0;
 
 not NOT1 (s0, a0);
 not NOT2 (s1, a1);
 not NOT3 (s2, a2);
 not NOT4 (s3, a3);
 not NOT5 (s4, a4);
 
endmodule

module testComplemento1;
 reg a4, a3, a2, a1, a0;
 wire s0, s1, s2, s3, s4;
 
 complemento1 Test01 (s0, s1, s2, s3, s4, a4, a3, a2, a1, a0);
 
 initial begin
      $display("Marden Batista - 388613");
      $display("Exe 01 - Complemento de 1");
      $display("\n a4 a3 a2 a1 a0 = s4 s3 s2 s1 s0");
		$monitor(" %b  %b  %b  %b  %b =  %b  %b  %b  %b  %b", a4, a3, a2, a1, a0, s4, s3, s2, s1, s0);
												
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