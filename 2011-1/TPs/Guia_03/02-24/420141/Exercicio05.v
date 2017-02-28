// guia 03
// Nome: Raphaela Fernanda Silva
// Matricula: 420120

module operadorMD ( s0,s1,a,b );

output s0,s1;
input a,b;
wire s2,s3,s4,s5,s6;

nor NOR1 (s2,b,b);
nor NOR2 (s3,a,a);
nor NOR3 (s4,s2,s3);
nor NOR4 (s5,a,b);
nor NOR5 (s0,s4,s5);
nor NOR6 (s6,b,b);
nor NOR7 (s1,a,s6);

endmodule

module testMD;
reg a,b;
wire s0,s1;

operadorMD MD (s0,s1,a,b);

initial begin: start
        a=0; b=0;

end

initial begin: main

#1 $display (" Modelo Tradicional ");
#1 $display (" a - b = s0s1 ");
   $monitor (" %b - %b = %b %b ",a,b,s0,s1);
	
	    #1 a=0;  b=1;
		 #1 a=1;  b=0;
		 #1 a=1;  b=1;
		 
end
endmodule


//   Modelo Tradicional 
//     a - b = s0s1 
//     0 - 0 = 0 0 
//     0 - 1 = 1 1 
//     1 - 0 = 1 0 
//     1 - 1 = 0 0 
//    
//     ----jGRASP: operation complete.
    
