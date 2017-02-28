// Giselle Caroline Vieira
// Matricula:424649

module usandonor (x, a, b);

output x;
input a, b;
wire temp1,temp2,temp3,temp4;

nor NOR1 (temp1, a);
nor NOR2 (temp2, b);
nor NOR3 (temp3, a, b);
nor NOR4 (temp4, temp1, temp2);
nor NOR5 (x, temp4, temp3); 

endmodule 

module usandonot (x1, a1);

output x1;
input a1;

nor NOR1 (x1, a1);

endmodule 

module usandonoreand (x2, b1, c);

output x2;
input b1, c;
wire e1,e2,e3;

nor NOR1 (e1, c);
usandonot NOT1 (e2, b1);
nor NOR2 (e3, e2);
nor NOR3 (x2, e3, e1); 

endmodule 

module meiadife (s1, Vout1, f1, g1);

output s1, Vout1;
input f1, g1;

usandonor NOR1 (s1, f1, g1);
usandonoreand AND1 (Vout1, f1, g1);

endmodule


module Testemeiadiferenca;

reg a, b;
wire d2, Vout2;


meiadife meiadife1 (d2, Vout2, a, b);

 initial begin
      $display("\na  b  Vout  d\n");
      $monitor("%b  %b   %b   %b", a, b, Vout2, d2);
  
	     a=0; b=0; 
    #1  a=0; b=0;  
    #1  a=0; b=1; 
    #1  a=0; b=1; 
	 #1  a=1; b=0; 
    #1  a=1; b=0;  
    #1  a=1; b=1;
    #1  a=1; b=1; 
	  
    end
 
endmodule 