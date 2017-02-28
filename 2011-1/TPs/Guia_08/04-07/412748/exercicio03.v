//----------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Nome: Jessica Luisa Betonico Andrade - // Matrícula: 412748

// GUIA 08 -  // Professor: Theldo

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------




module simplQM ( s,a,b,c,d,e );

	output s;
	input a,b,c,d,e;
	wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11;

	not NOT1 (s1,a);
	not NOT2 (s2,c);
	not NOT3 (s3,d);
	and AND1 (s4,s1,s2,s3);
	and AND2 (s5,a,c,s3);
	not NOT5 (s6,b);
	and AND3 (s7,s6,e);
	and AND4 (s8,c,e);
	not NOT6 (s9,b);
	not NOT7 (s10,c);
	and AND5 (s11,a,s9,s10,d);
	or OR1 (s,s4,s5,s7,s8,s11);

endmodule

module testQM;
	reg a,b,c,d,e;
	wire s;

	simplQM  QM ( s,a,b,c,d,e );

initial begin:start
        a=0; b=0; c=0; d=0; e=0;
end

initial begin: main
	#1 $display (" Exercicio 03 - Guia8 ");
	#1 $display (" a   b   c   d   e =   s ");
  	$monitor (" %b   %b   %b   %b   %b =   %b ",a,b,c,d,e,s);
           #1 a=0;  b=0;    c=0;   d=0;   e=1;
			  #1 a=0;  b=0;    c=0;   d=1;   e=0;
			  #1 a=0;  b=0;    c=0;   d=1;   e=1;
			  #1 a=0;  b=0;    c=1;   d=0;   e=0;
			  #1 a=0;  b=0;    c=1;   d=0;   e=1;
			  #1 a=0;  b=0;    c=1;   d=1;   e=0;
			  #1 a=0;  b=0;    c=1;   d=1;   e=1;
			  #1 a=0;  b=1;    c=0;   d=0;   e=0;
			  #1 a=0;  b=1;    c=0;   d=0;   e=1;
			  #1 a=0;  b=1;    c=0;   d=1;   e=0;
			  #1 a=0;  b=1;    c=0;   d=1;   e=1;
			  #1 a=0;  b=1;    c=1;   d=0;   e=0;
			  #1 a=0;  b=1;    c=1;   d=0;   e=1;
			  #1 a=0;  b=1;    c=1;   d=1;   e=0;
			  #1 a=0;  b=1;    c=1;   d=1;   e=1;
			  #1 a=1;  b=0;    c=0;   d=0;   e=0;
			  #1 a=1;  b=0;    c=0;   d=0;   e=1;
			  #1 a=1;  b=0;    c=0;   d=1;   e=0;
			  #1 a=1;  b=0;    c=0;   d=1;   e=1;
			  #1 a=1;  b=0;    c=1;   d=0;   e=0;
			  #1 a=1;  b=0;    c=1;   d=0;   e=1;
			  #1 a=1;  b=0;    c=1;   d=1;   e=0;
			  #1 a=1;  b=0;    c=1;   d=1;   e=1;
			  #1 a=1;  b=1;    c=0;   d=0;   e=0;
			  #1 a=1;  b=1;    c=0;   d=0;   e=1;
			  #1 a=1;  b=1;    c=0;   d=1;   e=0;
			  #1 a=1;  b=1;    c=0;   d=1;   e=1;
			  #1 a=1;  b=1;    c=1;   d=0;   e=0;
			  #1 a=1;  b=1;    c=1;   d=0;   e=1;
			  #1 a=1;  b=1;    c=1;   d=1;   e=0;
			  #1 a=1;  b=1;    c=1;   d=1;   e=1;
			  
			  
end
endmodule