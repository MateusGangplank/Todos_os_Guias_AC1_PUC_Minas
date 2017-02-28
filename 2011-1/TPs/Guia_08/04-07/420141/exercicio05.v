// Nome: Raphaela Fernanda Silva
// Matrícula: 420141

module simplQM ( s,a,b,c,d );

output s;
input a,b,c,d;
wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17;


nor NOR1 (s1,b,b);
nor NOR2 (s2,d,d);
nor NOR3 (s3,s1,s1);
nor NOR4 (s4,s2,s2);
nor NOR5 (s5,s3,s4);
nor NOR6 (s6,a,a);
nor NOR7 (s7,d,d);
nor NOR8 (s8,s6,s7);
nor NOR9 (s9,a,a);
nor NOR10 (s10,d,d);
nor NOR11 (s11,s9,b,s10);
nor NOR12 (s12,a,a);
nor NOR13 (s13,b,b);
nor NOR14 (s14,c,c);
nor NOR15 (s15,s14,s14);
nor NOR16 (s16,s12,s13,s15);
nor NOR17 (s17,s5,s8,s11,s16);
nor NOR18 (s,s17,s17);

endmodule

module testQM;
reg a,b,c,d;
wire s;

simplQM  QM ( s,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Exercicio 05 - Guia8 com porta NOR ");
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
