// ---------------------
// Guia06
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

module meiasoma (a,b,s0,s1);
output s0,s1;
input  a, b;
assign s1 = a & b;
xor XOR (s0,a,b);
endmodule

module somacompleta(a,b,cin,s0,s1);
output s0,s1;
input a,b,cin;
wire c1,c2;
meiasoma HA (cin,a,s,c1);
meiasoma HA2 (s,b,s0,c2);
assign s1 = c1 | c2;
endmodule
    
module soma4b(a,b,s,cout,ovr);
output [3:0]s;
output cout,ovr;
input [3:0]a;
input [3:0]b;
wire c0,c1,c2,c_out,not_ovr;
meiasoma HA (a[0],b[0],s[0],c0);
somacompleta FA1 (a[1],b[1],c0,s[1],c1);
somacompleta FA2 (a[2],b[2],c1,s[2],c2);
somacompleta FA3 (a[3],b[3],c2,s[3],c_out);
xor XOR1 (ovr, c2, c_out);
not NOT1 (not_ovr, ovr);
and AND1 (cout, not_ovr,c_out);
endmodule
	 
module testex1;
reg [3:0]a;
reg [3:0]b;
wire [3:0]s;
wire ovr,cout;
soma4b SOMA (a,b,s,cout,ovr);
initial begin
      $display("Exercicio 01 - Lucas Teixeira Santos - 415383");
      $display("AAAA  +  BBBB  = OVR COUT CCCC");
a = 4'b0000;
b = 4'b0000;
   #1	 $monitor("%4b  +  %4b  =  %b   %b    %4b", a, b,ovr, cout, s);
   #1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
	#1  b=b+1;
	#1  b=b+1;
   #1  b=b+1;
	#1  a=a+1;
 end

endmodule 
/* test
    AAAA  +  BBBB  = OVR COUT CCCC
    0000  +  0000  =  0   0    0000
    0000  +  0001  =  0   0    0001
    0000  +  0010  =  0   0    0010
    0001  +  0010  =  0   0    0011
    0001  +  0011  =  0   0    0100
    0001  +  0100  =  0   0    0101
    0010  +  0100  =  0   0    0110
    0010  +  0101  =  0   0    0111
    0010  +  0110  =  1   0    1000
    0011  +  0110  =  1   0    1001
    0011  +  0111  =  1   0    1010
    0011  +  1000  =  0   0    1011
    0100  +  1000  =  0   0    1100
    0100  +  1001  =  0   0    1101
    0100  +  1010  =  0   0    1110
    0101  +  1010  =  0   0    1111
    0101  +  1011  =  0   1    0000
    0101  +  1100  =  0   1    0001
    0110  +  1100  =  0   1    0010
    0110  +  1101  =  0   1    0011
    0110  +  1110  =  0   1    0100
    0111  +  1110  =  0   1    0101
    0111  +  1111  =  0   1    0110
    0111  +  0000  =  0   0    0111
    1000  +  0000  =  0   0    1000
    1000  +  0001  =  0   0    1001
    1000  +  0010  =  0   0    1010
    1001  +  0010  =  0   0    1011
    1001  +  0011  =  0   0    1100
    1001  +  0100  =  0   0    1101
    1010  +  0100  =  0   0    1110
    1010  +  0101  =  0   0    1111
    1010  +  0110  =  0   1    0000
    1011  +  0110  =  0   1    0001
    1011  +  0111  =  0   1    0010
    1011  +  1000  =  1   0    0011
    1100  +  1000  =  1   0    0100
    1100  +  1001  =  1   0    0101
    1100  +  1010  =  1   0    0110
    1101  +  1010  =  1   0    0111
    1101  +  1011  =  0   1    1000
    1101  +  1100  =  0   1    1001
    1110  +  1100  =  0   1    1010
    1110  +  1101  =  0   1    1011
    1110  +  1110  =  0   1    1100
    1110  +  1111  =  0   1    1101
    1111  +  1111  =  0   1    1110
/*