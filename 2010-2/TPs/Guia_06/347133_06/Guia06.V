// ---------------------
// Guia 06 
// Nome: Henrique Carvalho Parreira
// Matricula: 347133
// ---------------------

// ---------------------
// -- modulos
// ---------------------

module halfadder (a,b,s0,s1);
output s0,s1;
input  a, b;
assign s1 = a & b;
xor XOR (s0,a,b);
endmodule

module fulladder (a, b, cin, s, co);
 input a, b, cin;
 output s, co;
 wire t1, t2, t3;
 
 xor  xor_1 (s, a, b, cin);
 
 and  and_1 (t1, a, b),
        and_2 (t2, a, cin),
		  and_3 (t3, b, cin);
		  
 or  or_1 (co, t1, t2, t3);
 
 endmodule //fulladder
    
module soma(a,b,s,cout,ovr);
output [3:0]s;
output cout,ovr;
input [3:0]a;
input [3:0]b;
wire c0,c1,c2,c_out,not_ovr;
halfadder HA (a[0],b[0],s[0],c0);
fulladder FA1 (a[1],b[1],c0,s[1],c1);
fulladder FA2 (a[2],b[2],c1,s[2],c2);
fulladder FA3 (a[3],b[3],c2,s[3],c_out);
xor XOR1 (ovr, c2, c_out);
not NOT1 (not_ovr, ovr);
and AND1 (cout, not_ovr,c_out);
endmodule
	 
// ---------------------
// -- Exercicio0601
// ---------------------

module Exercicio0601;
reg [3:0]a;
reg [3:0]b;
wire [3:0]s;
wire ovr,cout;
soma S1 (a,b,s,cout,ovr);
initial begin
		$display("Henrique Carvalho Parreira");
		$display("");
      $display("A    +  B   =    OVR COUT  S  ");
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

endmodule //Exercicio0601