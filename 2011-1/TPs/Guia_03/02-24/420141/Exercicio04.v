// guia 03
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module operadorMS ( s0,s1,a,b );

output s0,s1;
input a,b;
wire s2,s3,s4,s5,s6,s7,s8;

nor NOR1( s2,a,b );
nor NOR2( s3,s2,s2 );
nor NOR3( s4,s3,s3 );
nor NOR4( s5,a,a );
nor NOR5( s6,b,b );
nor NOR6( s1,s5,s6 );
nor NOR7( s7,s1 );
nor NOR8( s8,s7,s7 );
nor NOR9( s0,s4,s8 );

endmodule

module testMS;
reg a,b;
wire s0,s1;

operadorMS MS (s0,s1,a,b );

initial begin: start
        a=0; b=0;

end

initial begin: main

#1 $display (" Modelo Tradicional ");
#1 $display (" a + b = s0s1 ");
   $monitor (" %b + %b = %b %b ",a,b,s0,s1);
	
	    #1 a=0;  b=1;
		 #1 a=1;  b=0;
		 #1 a=1;  b=1;
		 
end
endmodule


//  
//     Modelo Tradicional 
//     a + b = s0s1 
//     0 + 0 = 0 0 
//     0 + 1 = 1 0 
//     1 + 1 = 0 1 
//    
//     ----jGRASP: operation complete.
    