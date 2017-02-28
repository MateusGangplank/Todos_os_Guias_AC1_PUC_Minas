// Giselle Caroline Vieira
// Matricula:424649

module meiadife (s, V1, a, b);

output s, V1;
input b, a;

xor XOR1 (s, a, b);
and AND1 (V1, ~a, b);

endmodule

module diferencacomp (s1, Vout, Vin, a1, b1);

output s1, Vout; 
input a1, b1, Vin;
wire temp1, temp2, temp3;

meiadife meiadife1 (temp1, temp2, a1, b1);
meiadife meiadife2 (s1, temp3, temp1, Vin);
or OR1 (Vout, t3, t2);
endmodule
module Testediferencacompleta;

reg a, b, Vin1;
wire s2, Vout2;

diferencacomp diferencacomp1 (s2, Vout2, Vin1, a, b);

 initial begin
      $display("\na  b  Vin   V1  s\n");
      $monitor("%b  %b   %b    %b    %b", a, b, Vin1, Vout2, s2);
  
	     a=0; b=0; Vin1 =0;
    #1  a=0; b=0; Vin1 =1; 
    #1  a=0; b=1; Vin1 =0;
    #1  a=0; b=1; Vin1 =1; 
	 #1  a=1; b=0; Vin1 =0;
    #1  a=1; b=0; Vin1 =1; 
    #1  a=1; b=1; Vin1 =0;
    #1  a=1; b=1; Vin1 =1; 
	  
    end
 endmodule
