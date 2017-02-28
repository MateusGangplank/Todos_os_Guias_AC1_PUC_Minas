// Guia 03
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module operadorMS ( s0, s4, a, b);

output s0, s4;
input a, b;
wire s2, s3, s4;

or OR1(s2, a, b);
and AND1(s4, a, b);
not NOT1(s3,s4);
and AND2(s0,s2,s3);

endmodule

module testMS;
reg a, b;
wire s0, s1;

operadorMS MS (s0, s1, a, b);

initial begin : start
		a=0; b=0;
end

initial begin : main

#1 $display ( " Modelo Tradicional " );
#1 $display ( "a + b = s0 s1" );
	$monitor ( "%b + %b = %b  %b ",a,b,s0,s1);
	
		#1	a=0;	b=1;
 		#1	a=1;	b=0;
		#1	a=1;	b=1;
		
end

endmodule

//  Modelo Tradicional 
//  a + b = s0 s1
//  0 + 0 = 0  0 
//  0 + 1 = 1  0 
//  1 + 0 = 1  0 
//  1 + 1 = 0  1
	 