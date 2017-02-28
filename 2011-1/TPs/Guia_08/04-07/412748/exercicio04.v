//----------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Nome: Jessica Luisa Betonico Andrade - // Matrícula: 412748

// GUIA 08 -  // Professor: Theldo

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------







module simplQM ( s,a,b,c,d );

	output s;
	input a,b,c,d;
	wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10;

	nand NAND1 (s1,c,c);
	nand NAND2 (s2,a,c,d);
	nand NAND3 (s10,s2,s2);
	nand NAND4 (s3,a,a);
	nand NAND5 (s4,s3,c);
	nand NAND6 (s5,s4,s4);
	nand NAND7 (s6,b,d);
	nand NAND8 (s7,s6,s6);
	nand NAND9 (s8,b,c);
	nand NAND10 (s9,s8,s8);
	nand NAND11 (s,s10,s5,s7,s9);

endmodule

module testQM;
	reg a,b,c,d;
	wire s;

	simplQM QM ( s,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
	#1 $display (" Exercicio 04 - Guia8 com porta NAND ");
	#1 $display (" a   b   c   d  =   s ");
  	$monitor (" %b   %b   %b   %b  =   %b ",a,b,c,d,s);
           #1 a=0;    b=0;   c=0;   d=1;
			  #1 a=0;    b=0;   c=1;   d=0;
			  #1 a=0;    b=0;   c=1;   d=1;
			  #1 a=0;    b=1;   c=0;   d=0;
			  #1 a=0;    b=1;   c=0;   d=1;
			  #1 a=0;    b=1;   c=1;   d=0;
			  #1 a=0;    b=1;   c=1;   d=1;
			  #1 a=1;    b=0;   c=0;   d=0;
			  #1 a=1;    b=0;   c=0;   d=1;
			  #1 a=1;    b=0;   c=1;   d=0;
			  #1 a=1;    b=0;   c=1;   d=1;
			  #1 a=1;    b=1;   c=0;   d=0;
			  #1 a=1;    b=1;   c=0;   d=1;
			  #1 a=1;    b=1;   c=1;   d=0;
			  #1 a=1;    b=1;   c=1;   d=1;
			  
			  
			  
end
endmodule