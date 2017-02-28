// -------------------------
// Guia 06 - ALU de 5 bits
// Nome: Alyson Deives
// Matricula: 416589
// -------------------------

// ------------------------------------
// -- ALU 5 bits
// ------------------------------------

module alu (ov,sinal,s,amb,bma,eq,a,b,op);
output ov,sinal,amb,bma,eq;
output [3:0] s;
input op;
input [3:0] a;
input [3:0] b;
wire [3:0] c;
wire [3:0] d;
wire [3:0] e;
wire [3:0] f;
wire [4:0] g;
wire [4:0] h;

not not1 (nop,op);

and AND1 (c[0],a[0],nop);
and AND2 (c[1],a[1],nop);
and AND3 (c[2],a[2],nop);
and AND4 (c[3],a[3],nop);

and AND5 (d[0],b[0],nop);
and AND6 (d[1],b[1],nop);
and AND7 (d[2],b[2],nop);
and AND8 (d[3],b[3],nop);

and AND9 (e[0],a[0],op);
and AND10 (e[1],a[1],op);
and AND11 (e[2],a[2],op);
and AND12 (e[3],a[3],op);

and AND13 (f[0],b[0],op);
and AND14 (f[1],b[1],op);
and AND15 (f[2],b[2],op);
and AND16 (f[3],b[3],op);

four_bits_fulladder_nor FBFA1 (g,c,d);
four_bits_fullsubtractor_nor FBFS1 (h,e,f);
logic_comparator CL1 (eq,a,b);

or OR1 (s[0],g[0],h[0]);
or OR1 (s[1],g[1],h[1]);
or OR1 (s[2],g[2],h[2]);
or OR1 (s[3],g[3],h[3]);

assign ov = g[4];
assign sinal = h[4];

nor NOR1 (amb,eq,h[4]);
assign bma = h[4];

endmodule // ALU 

// ------------------------------------
// -- Logic Comparator
// ------------------------------------

module logic_comparator(s,a,b);
output s;
input [3:0] a;
input [3:0] b;

xnor XNOR1 (temp1,a[0],b[0]);
xnor XNOR2 (temp2,a[1],b[1]);
xnor XNOR3 (temp3,a[2],b[2]);
xnor XNOR4 (temp4,a[3],b[3]);

and AND1 (s,temp1,temp2,temp3,temp4);

endmodule //logic_comparator


// ------------------------------------
// -- 4 bits full adder with NOR gate
// ------------------------------------

module four_bits_fulladder_nor (c,a,b);
output [4:0] c;
input [3:0] a;
input [3:0] b;


halfadder_nor HA1 (c[0],carry1,a[0],b[0]);
fulladder_nor FA1 (c[1],carry2,a[1],b[1],carry1);
fulladder_nor FA2 (c[2],carry3,a[2],b[2],carry2);
fulladder_nor FA3 (c[3],c[4],a[3],b[3],carry3);

endmodule // 4_bits_full_adder_nor


// -------------------------------
// -- full adder with NOR gate
// -------------------------------

module fulladder_nor (c0,c1,r,s,t);
output c0,c1;
input r,s,t;
wire carry1,carry2,cout;

halfadder_nor HA1 (cout,carry1,r,s);
halfadder_nor HA2 (c0,carry2,cout,t);
or_nor OR1 (c1,carry1,carry2);

endmodule // full_adder

// -------------------------------
// -- half adder with NOR gate
// -------------------------------

module halfadder_nor (s0, s1, a, b);
 output s0,s1;
 input  a, b;
 
  xor_nor XOR1 (s0,a,b);
  and_nor AND1 (s1,a,b);

endmodule // halfadder_nor

// -------------------------------
// -- 4 bits full subtractor with with NOR gate
// -------------------------------

module four_bits_fullsubtractor_nor (c,a,b);
output [4:0] c;
input [3:0] a;
input [3:0] b;


halfsubtractor_nor HS1 (carry1,c[0],a[0],b[0]);
fullsubtractor_nor FS1 (carry2,c[1],a[1],b[1],carry1);
fullsubtractor_nor FS2 (carry3,c[2],a[2],b[2],carry2);
fullsubtractor_nor FS3 (c[4],c[3],a[3],b[3],carry3);


endmodule // 4_bits_full_adder_nor

// -------------------------------
// -- full subtractor with NOR gate
// -------------------------------

module fullsubtractor_nor (c1,c0,r,s,t);
output c0,c1;
input r,s,t;

halfsubtractor_nor HS1 (cout,carry1,r,s);
halfsubtractor_nor HS2 (c0,carry2,cout,t);
or_nor OR1 (c1,carry1,carry2);

endmodule // full_subtractor

/// -------------------------------
// -- half subtractor with NOR gate
// -------------------------------

module halfsubtractor_nor (s0, s1, a, b);
 output s0,s1;
 input  a, b;
 
  xor_nor XOR1 (s0,a,b);
  not_nor NOT1(temp1, a);
  and_nor AND1 (s1,temp1,b);

endmodule // halfsubtractor_nor


// ---------------------
// -- xor with NOR gate
// ---------------------

module xor_nor (s, a, b);
 output s;
 input  a, b;
 wire temp1,temp2,temp3,temp4,temp5,temp6;
 
  nor NOR1 (temp1,b,b);
  nor NOR2 (temp2,a,a);
  nor NOR3 (temp3,a,temp1);
  nor NOR4 (temp4,b,temp2);
  nor NOR5 (temp5, temp3, temp4); 
  nor NOR6 (s, temp5, temp5); 
  
endmodule // xor_nor


// ---------------------
// -- and with NOR gate
// ---------------------

module and_nor (s, a, b);
 output s;
 input  a, b;
 wire temp1,temp2;
 
  nor NOR1 (temp1,a,a);
  nor NOR2 (temp2,b,b);
  nor NOR3 (s, temp1,temp2);

endmodule // and_nor

// ---------------------
// -- or with NOR gate
// ---------------------

module or_nor (s, a, b);
 output s;
 input  a, b;
 wire temp1;
 
  nor NOR1 (temp1,a,b);
  nor NOR2 (s,temp1,temp1);
  
endmodule // or_nor

// ---------------------
// -- not with NOR gate
// ---------------------

module not_nor (s, a);
 output s;
 input  a;
 
  nor NOR1 (s,a,a);
  
endmodule // not_nor

// ----------------------------------
// -- test ALU
// ----------------------------------

module test;
 reg op;
 reg [3:0]  a;
 reg [3:0]  b;
 wire ov,sinal,amb,bma,eq;
 wire [3:0] s;
 integer i,j;
          
// instancia
alu ALU1 (ov,sinal,s,amb,bma,eq,a,b,op);
 
initial begin:start
      a=0; b=0;op=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 06 - Alyson Deives - 416589");
      $display("ALU de 5 bits\n");
		$display("\nOp	A	B	Ov/Carry	Sinal	C	A>B	B>A	A=B\n");
		$monitor("%b	%b%b%b%b	%b%b%b%b	%b	%b	%b%b%b%b	%b	%b	%b", op,a[3],a[2],a[1],a[0],b[3],b[2],b[1],b[0],ov,sinal,s[3],s[2],s[1],s[0],amb,bma,eq); 
  for(i=0;i<=15;i=i+1) 
  	begin	
  		for(j=0;j<=15;j=j+1) 
  			begin
			#1 a = i;b=j;
								 			 
  		end	
  end 
  #1 op = 1;
  for(i=0;i<=15;i=i+1) 
  	begin	
  		for(j=0;j<=15;j=j+1) 
  			begin
			#1 a = i;b=j;				 			 
  		end	
  end 
end    

endmodule // test alu

 // ----------------------------------------------------
 // -- TESTE
 // ----------------------------------------------------
	 -- Guia 06 - Alyson Deives - 416589
    -- ALU de 5 bits
    -- 
    -- 
    -- Op A	     B	Ov/Carry	Sinal	C	A>B	B>A	A=B
    -- 
    -- 0	0000	0000	0	0	0000	0	0	1
    -- 0	0000	0001	0	0	0001	1	0	0
    -- 0	0000	0010	0	0	0010	1	0	0
    -- 0	0000	0011	0	0	0011	1	0	0
    -- 0	0000	0100	0	0	0100	1	0	0
    -- 0	0000	0101	0	0	0101	1	0	0
    -- 0	0000	0110	0	0	0110	1	0	0
    -- 0	0000	0111	0	0	0111	1	0	0
    -- 0	0000	1000	0	0	1000	1	0	0
    -- 0	0000	1001	0	0	1001	1	0	0
    -- 0	0000	1010	0	0	1010	1	0	0
    -- 0	0000	1011	0	0	1011	1	0	0
    -- 0	0000	1100	0	0	1100	1	0	0
    -- 0	0000	1101	0	0	1101	1	0	0
    -- 0	0000	1110	0	0	1110	1	0	0
    -- 0	0000	1111	0	0	1111	1	0	0
    -- 0	0001	0000	0	0	0001	1	0	0
    -- 0	0001	0001	0	0	0010	0	0	1
    -- 0	0001	0010	0	0	0011	1	0	0
    -- 0	0001	0011	0	0	0100	1	0	0
    -- 0	0001	0100	0	0	0101	1	0	0
    -- 0	0001	0101	0	0	0110	1	0	0
    -- 0	0001	0110	0	0	0111	1	0	0
    -- 0	0001	0111	0	0	1000	1	0	0
    -- 0	0001	1000	0	0	1001	1	0	0
    -- 0	0001	1001	0	0	1010	1	0	0
    -- 0	0001	1010	0	0	1011	1	0	0
    -- 0	0001	1011	0	0	1100	1	0	0
    -- 0	0001	1100	0	0	1101	1	0	0
    -- 0	0001	1101	0	0	1110	1	0	0
    -- 0	0001	1110	0	0	1111	1	0	0
    -- 0	0001	1111	1	0	0000	1	0	0
    -- 0	0010	0000	0	0	0010	1	0	0
    -- 0	0010	0001	0	0	0011	1	0	0
    -- 0	0010	0010	0	0	0100	0	0	1
    -- 0	0010	0011	0	0	0101	1	0	0
    -- 0	0010	0100	0	0	0110	1	0	0
    -- 0	0010	0101	0	0	0111	1	0	0
    -- 0	0010	0110	0	0	1000	1	0	0
    -- 0	0010	0111	0	0	1001	1	0	0
    -- 0	0010	1000	0	0	1010	1	0	0
    -- 0	0010	1001	0	0	1011	1	0	0
    -- 0	0010	1010	0	0	1100	1	0	0
    -- 0	0010	1011	0	0	1101	1	0	0
    -- 0	0010	1100	0	0	1110	1	0	0
    -- 0	0010	1101	0	0	1111	1	0	0
    -- 0	0010	1110	1	0	0000	1	0	0
    -- 0	0010	1111	1	0	0001	1	0	0
    -- 0	0011	0000	0	0	0011	1	0	0
    -- 0	0011	0001	0	0	0100	1	0	0
    -- 0	0011	0010	0	0	0101	1	0	0
    -- 0	0011	0011	0	0	0110	0	0	1
    -- 0	0011	0100	0	0	0111	1	0	0
    -- 0	0011	0101	0	0	1000	1	0	0
    -- 0	0011	0110	0	0	1001	1	0	0
    -- 0	0011	0111	0	0	1010	1	0	0
    -- 0	0011	1000	0	0	1011	1	0	0
    -- 0	0011	1001	0	0	1100	1	0	0
    -- 0	0011	1010	0	0	1101	1	0	0
    -- 0	0011	1011	0	0	1110	1	0	0
    -- 0	0011	1100	0	0	1111	1	0	0
    -- 0	0011	1101	1	0	0000	1	0	0
    -- 0	0011	1110	1	0	0001	1	0	0
    -- 0	0011	1111	1	0	0010	1	0	0
    -- 0	0100	0000	0	0	0100	1	0	0
    -- 0	0100	0001	0	0	0101	1	0	0
    -- 0	0100	0010	0	0	0110	1	0	0
    -- 0	0100	0011	0	0	0111	1	0	0
    -- 0	0100	0100	0	0	1000	0	0	1
    -- 0	0100	0101	0	0	1001	1	0	0
    -- 0	0100	0110	0	0	1010	1	0	0
    -- 0	0100	0111	0	0	1011	1	0	0
    -- 0	0100	1000	0	0	1100	1	0	0
    -- 0	0100	1001	0	0	1101	1	0	0
    -- 0	0100	1010	0	0	1110	1	0	0
    -- 0	0100	1011	0	0	1111	1	0	0
    -- 0	0100	1100	1	0	0000	1	0	0
    -- 0	0100	1101	1	0	0001	1	0	0
    -- 0	0100	1110	1	0	0010	1	0	0
    -- 0	0100	1111	1	0	0011	1	0	0
    -- 0	0101	0000	0	0	0101	1	0	0
    -- 0	0101	0001	0	0	0110	1	0	0
    -- 0	0101	0010	0	0	0111	1	0	0
    -- 0	0101	0011	0	0	1000	1	0	0
    -- 0	0101	0100	0	0	1001	1	0	0
    -- 0	0101	0101	0	0	1010	0	0	1
    -- 0	0101	0110	0	0	1011	1	0	0
    -- 0	0101	0111	0	0	1100	1	0	0
    -- 0	0101	1000	0	0	1101	1	0	0
    -- 0	0101	1001	0	0	1110	1	0	0
    -- 0	0101	1010	0	0	1111	1	0	0
    -- 0	0101	1011	1	0	0000	1	0	0
    -- 0	0101	1100	1	0	0001	1	0	0
    -- 0	0101	1101	1	0	0010	1	0	0
    -- 0	0101	1110	1	0	0011	1	0	0
    -- 0	0101	1111	1	0	0100	1	0	0
    -- 0	0110	0000	0	0	0110	1	0	0
    -- 0	0110	0001	0	0	0111	1	0	0
    -- 0	0110	0010	0	0	1000	1	0	0
    -- 0	0110	0011	0	0	1001	1	0	0
    -- 0	0110	0100	0	0	1010	1	0	0
    -- 0	0110	0101	0	0	1011	1	0	0
    -- 0	0110	0110	0	0	1100	0	0	1
    -- 0	0110	0111	0	0	1101	1	0	0
    -- 0	0110	1000	0	0	1110	1	0	0
    -- 0	0110	1001	0	0	1111	1	0	0
    -- 0	0110	1010	1	0	0000	1	0	0
    -- 0	0110	1011	1	0	0001	1	0	0
    -- 0	0110	1100	1	0	0010	1	0	0
    -- 0	0110	1101	1	0	0011	1	0	0
    -- 0	0110	1110	1	0	0100	1	0	0
    -- 0	0110	1111	1	0	0101	1	0	0
    -- 0	0111	0000	0	0	0111	1	0	0
    -- 0	0111	0001	0	0	1000	1	0	0
    -- 0	0111	0010	0	0	1001	1	0	0
    -- 0	0111	0011	0	0	1010	1	0	0
    -- 0	0111	0100	0	0	1011	1	0	0
    -- 0	0111	0101	0	0	1100	1	0	0
    -- 0	0111	0110	0	0	1101	1	0	0
    -- 0	0111	0111	0	0	1110	0	0	1
    -- 0	0111	1000	0	0	1111	1	0	0
    -- 0	0111	1001	1	0	0000	1	0	0
    -- 0	0111	1010	1	0	0001	1	0	0
    -- 0	0111	1011	1	0	0010	1	0	0
    -- 0	0111	1100	1	0	0011	1	0	0
    -- 0	0111	1101	1	0	0100	1	0	0
    -- 0	0111	1110	1	0	0101	1	0	0
    -- 0	0111	1111	1	0	0110	1	0	0
    -- 0	1000	0000	0	0	1000	1	0	0
    -- 0	1000	0001	0	0	1001	1	0	0
    -- 0	1000	0010	0	0	1010	1	0	0
    -- 0	1000	0011	0	0	1011	1	0	0
    -- 0	1000	0100	0	0	1100	1	0	0
    -- 0	1000	0101	0	0	1101	1	0	0
    -- 0	1000	0110	0	0	1110	1	0	0
    -- 0	1000	0111	0	0	1111	1	0	0
    -- 0	1000	1000	1	0	0000	0	0	1
    -- 0	1000	1001	1	0	0001	1	0	0
    -- 0	1000	1010	1	0	0010	1	0	0
    -- 0	1000	1011	1	0	0011	1	0	0
    -- 0	1000	1100	1	0	0100	1	0	0
    -- 0	1000	1101	1	0	0101	1	0	0
    -- 0	1000	1110	1	0	0110	1	0	0
    -- 0	1000	1111	1	0	0111	1	0	0
    -- 0	1001	0000	0	0	1001	1	0	0
    -- 0	1001	0001	0	0	1010	1	0	0
    -- 0	1001	0010	0	0	1011	1	0	0
    -- 0	1001	0011	0	0	1100	1	0	0
    -- 0	1001	0100	0	0	1101	1	0	0
    -- 0	1001	0101	0	0	1110	1	0	0
    -- 0	1001	0110	0	0	1111	1	0	0
    -- 0	1001	0111	1	0	0000	1	0	0
    -- 0	1001	1000	1	0	0001	1	0	0
    -- 0	1001	1001	1	0	0010	0	0	1
    -- 0	1001	1010	1	0	0011	1	0	0
    -- 0	1001	1011	1	0	0100	1	0	0
    -- 0	1001	1100	1	0	0101	1	0	0
    -- 0	1001	1101	1	0	0110	1	0	0
    -- 0	1001	1110	1	0	0111	1	0	0
    -- 0	1001	1111	1	0	1000	1	0	0
    -- 0	1010	0000	0	0	1010	1	0	0
    -- 0	1010	0001	0	0	1011	1	0	0
    -- 0	1010	0010	0	0	1100	1	0	0
    -- 0	1010	0011	0	0	1101	1	0	0
    -- 0	1010	0100	0	0	1110	1	0	0
    -- 0	1010	0101	0	0	1111	1	0	0
    -- 0	1010	0110	1	0	0000	1	0	0
    -- 0	1010	0111	1	0	0001	1	0	0
    -- 0	1010	1000	1	0	0010	1	0	0
    -- 0	1010	1001	1	0	0011	1	0	0
    -- 0	1010	1010	1	0	0100	0	0	1
    -- 0	1010	1011	1	0	0101	1	0	0
    -- 0	1010	1100	1	0	0110	1	0	0
    -- 0	1010	1101	1	0	0111	1	0	0
    -- 0	1010	1110	1	0	1000	1	0	0
    -- 0	1010	1111	1	0	1001	1	0	0
    -- 0	1011	0000	0	0	1011	1	0	0
    -- 0	1011	0001	0	0	1100	1	0	0
    -- 0	1011	0010	0	0	1101	1	0	0
    -- 0	1011	0011	0	0	1110	1	0	0
    -- 0	1011	0100	0	0	1111	1	0	0
    -- 0	1011	0101	1	0	0000	1	0	0
    -- 0	1011	0110	1	0	0001	1	0	0
    -- 0	1011	0111	1	0	0010	1	0	0
    -- 0	1011	1000	1	0	0011	1	0	0
    -- 0	1011	1001	1	0	0100	1	0	0
    -- 0	1011	1010	1	0	0101	1	0	0
    -- 0	1011	1011	1	0	0110	0	0	1
    -- 0	1011	1100	1	0	0111	1	0	0
    -- 0	1011	1101	1	0	1000	1	0	0
    -- 0	1011	1110	1	0	1001	1	0	0
    -- 0	1011	1111	1	0	1010	1	0	0
    -- 0	1100	0000	0	0	1100	1	0	0
    -- 0	1100	0001	0	0	1101	1	0	0
    -- 0	1100	0010	0	0	1110	1	0	0
    -- 0	1100	0011	0	0	1111	1	0	0
    -- 0	1100	0100	1	0	0000	1	0	0
    -- 0	1100	0101	1	0	0001	1	0	0
    -- 0	1100	0110	1	0	0010	1	0	0
    -- 0	1100	0111	1	0	0011	1	0	0
    -- 0	1100	1000	1	0	0100	1	0	0
    -- 0	1100	1001	1	0	0101	1	0	0
    -- 0	1100	1010	1	0	0110	1	0	0
    -- 0	1100	1011	1	0	0111	1	0	0
    -- 0	1100	1100	1	0	1000	0	0	1
    -- 0	1100	1101	1	0	1001	1	0	0
    -- 0	1100	1110	1	0	1010	1	0	0
    -- 0	1100	1111	1	0	1011	1	0	0
    -- 0	1101	0000	0	0	1101	1	0	0
    -- 0	1101	0001	0	0	1110	1	0	0
    -- 0	1101	0010	0	0	1111	1	0	0
    -- 0	1101	0011	1	0	0000	1	0	0
    -- 0	1101	0100	1	0	0001	1	0	0
    -- 0	1101	0101	1	0	0010	1	0	0
    -- 0	1101	0110	1	0	0011	1	0	0
    -- 0	1101	0111	1	0	0100	1	0	0
    -- 0	1101	1000	1	0	0101	1	0	0
    -- 0	1101	1001	1	0	0110	1	0	0
    -- 0	1101	1010	1	0	0111	1	0	0
    -- 0	1101	1011	1	0	1000	1	0	0
    -- 0	1101	1100	1	0	1001	1	0	0
    -- 0	1101	1101	1	0	1010	0	0	1
    -- 0	1101	1110	1	0	1011	1	0	0
    -- 0	1101	1111	1	0	1100	1	0	0
    -- 0	1110	0000	0	0	1110	1	0	0
    -- 0	1110	0001	0	0	1111	1	0	0
    -- 0	1110	0010	1	0	0000	1	0	0
    -- 0	1110	0011	1	0	0001	1	0	0
    -- 0	1110	0100	1	0	0010	1	0	0
    -- 0	1110	0101	1	0	0011	1	0	0
    -- 0	1110	0110	1	0	0100	1	0	0
    -- 0	1110	0111	1	0	0101	1	0	0
    -- 0	1110	1000	1	0	0110	1	0	0
    -- 0	1110	1001	1	0	0111	1	0	0
    -- 0	1110	1010	1	0	1000	1	0	0
    -- 0	1110	1011	1	0	1001	1	0	0
    -- 0	1110	1100	1	0	1010	1	0	0
    -- 0	1110	1101	1	0	1011	1	0	0
    -- 0	1110	1110	1	0	1100	0	0	1
    -- 0	1110	1111	1	0	1101	1	0	0
    -- 0	1111	0000	0	0	1111	1	0	0
    -- 0	1111	0001	1	0	0000	1	0	0
    -- 0	1111	0010	1	0	0001	1	0	0
    -- 0	1111	0011	1	0	0010	1	0	0
    -- 0	1111	0100	1	0	0011	1	0	0
    -- 0	1111	0101	1	0	0100	1	0	0
    -- 0	1111	0110	1	0	0101	1	0	0
    -- 0	1111	0111	1	0	0110	1	0	0
    -- 0	1111	1000	1	0	0111	1	0	0
    -- 0	1111	1001	1	0	1000	1	0	0
    -- 0	1111	1010	1	0	1001	1	0	0
    -- 0	1111	1011	1	0	1010	1	0	0
    -- 0	1111	1100	1	0	1011	1	0	0
    -- 0	1111	1101	1	0	1100	1	0	0
    -- 0	1111	1110	1	0	1101	1	0	0
    -- 0	1111	1111	1	0	1110	0	0	1
    -- 1	1111	1111	0	0	0000	0	0	1
    -- 1	0000	0000	0	0	0000	0	0	1
    -- 1	0000	0001	0	1	1111	0	1	0
    -- 1	0000	0010	0	1	1110	0	1	0
    -- 1	0000	0011	0	1	1101	0	1	0
    -- 1	0000	0100	0	1	1100	0	1	0
    -- 1	0000	0101	0	1	1011	0	1	0
    -- 1	0000	0110	0	1	1010	0	1	0
    -- 1	0000	0111	0	1	1001	0	1	0
    -- 1	0000	1000	0	1	1000	0	1	0
    -- 1	0000	1001	0	1	0111	0	1	0
    -- 1	0000	1010	0	1	0110	0	1	0
    -- 1	0000	1011	0	1	0101	0	1	0
    -- 1	0000	1100	0	1	0100	0	1	0
    -- 1	0000	1101	0	1	0011	0	1	0
    -- 1	0000	1110	0	1	0010	0	1	0
    -- 1	0000	1111	0	1	0001	0	1	0
    -- 1	0001	0000	0	1	1110	0	1	0
    -- 1	0001	0001	0	0	0000	0	0	1
    -- 1	0001	0010	0	1	1100	0	1	0
    -- 1	0001	0011	0	1	1110	0	1	0
    -- 1	0001	0100	0	1	1010	0	1	0
    -- 1	0001	0101	0	1	1100	0	1	0
    -- 1	0001	0110	0	1	1000	0	1	0
    -- 1	0001	0111	0	1	1010	0	1	0
    -- 1	0001	1000	0	1	0110	0	1	0
    -- 1	0001	1001	0	1	1000	0	1	0
    -- 1	0001	1010	0	1	0100	0	1	0
    -- 1	0001	1011	0	1	0110	0	1	0
    -- 1	0001	1100	0	1	0010	0	1	0
    -- 1	0001	1101	0	1	0100	0	1	0
    -- 1	0001	1110	0	1	0000	0	1	0
    -- 1	0001	1111	0	1	0010	0	1	0
    -- 1	0010	0000	0	0	0010	1	0	0
    -- 1	0010	0001	0	0	0001	1	0	0
    -- 1	0010	0010	0	0	0000	0	0	1
    -- 1	0010	0011	0	1	1111	0	1	0
    -- 1	0010	0100	0	1	1110	0	1	0
    -- 1	0010	0101	0	1	1101	0	1	0
    -- 1	0010	0110	0	1	1100	0	1	0
    -- 1	0010	0111	0	1	1011	0	1	0
    -- 1	0010	1000	0	1	1010	0	1	0
    -- 1	0010	1001	0	1	1001	0	1	0
    -- 1	0010	1010	0	1	1000	0	1	0
    -- 1	0010	1011	0	1	0111	0	1	0
    -- 1	0010	1100	0	1	0110	0	1	0
    -- 1	0010	1101	0	1	0101	0	1	0
    -- 1	0010	1110	0	1	0100	0	1	0
    -- 1	0010	1111	0	1	0011	0	1	0
    -- 1	0011	0000	0	0	0000	1	0	0
    -- 1	0011	0001	0	0	0010	1	0	0
    -- 1	0011	0010	0	1	1110	0	1	0
    -- 1	0011	0011	0	0	0000	0	0	1
    -- 1	0011	0100	0	1	1100	0	1	0
    -- 1	0011	0101	0	1	1110	0	1	0
    -- 1	0011	0110	0	1	1010	0	1	0
    -- 1	0011	0111	0	1	1100	0	1	0
    -- 1	0011	1000	0	1	1000	0	1	0
    -- 1	0011	1001	0	1	1010	0	1	0
    -- 1	0011	1010	0	1	0110	0	1	0
    -- 1	0011	1011	0	1	1000	0	1	0
    -- 1	0011	1100	0	1	0100	0	1	0
    -- 1	0011	1101	0	1	0110	0	1	0
    -- 1	0011	1110	0	1	0010	0	1	0
    -- 1	0011	1111	0	1	0100	0	1	0
    -- 1	0100	0000	0	0	0100	1	0	0
    -- 1	0100	0001	0	0	0011	1	0	0
    -- 1	0100	0010	0	0	0010	1	0	0
    -- 1	0100	0011	0	0	0001	1	0	0
    -- 1	0100	0100	0	0	0000	0	0	1
    -- 1	0100	0101	0	1	1111	0	1	0
    -- 1	0100	0110	0	1	1110	0	1	0
    -- 1	0100	0111	0	1	1101	0	1	0
    -- 1	0100	1000	0	1	1100	0	1	0
    -- 1	0100	1001	0	1	1011	0	1	0
    -- 1	0100	1010	0	1	1010	0	1	0
    -- 1	0100	1011	0	1	1001	0	1	0
    -- 1	0100	1100	0	1	1000	0	1	0
    -- 1	0100	1101	0	1	0111	0	1	0
    -- 1	0100	1110	0	1	0110	0	1	0
    -- 1	0100	1111	0	1	0101	0	1	0
    -- 1	0101	0000	0	0	0010	1	0	0
    -- 1	0101	0001	0	0	0100	1	0	0
    -- 1	0101	0010	0	0	0000	1	0	0
    -- 1	0101	0011	0	0	0010	1	0	0
    -- 1	0101	0100	0	1	1110	0	1	0
    -- 1	0101	0101	0	0	0000	0	0	1
    -- 1	0101	0110	0	1	1100	0	1	0
    -- 1	0101	0111	0	1	1110	0	1	0
    -- 1	0101	1000	0	1	1010	0	1	0
    -- 1	0101	1001	0	1	1100	0	1	0
    -- 1	0101	1010	0	1	1000	0	1	0
    -- 1	0101	1011	0	1	1010	0	1	0
    -- 1	0101	1100	0	1	0110	0	1	0
    -- 1	0101	1101	0	1	1000	0	1	0
    -- 1	0101	1110	0	1	0100	0	1	0
    -- 1	0101	1111	0	1	0110	0	1	0
    -- 1	0110	0000	0	0	0110	1	0	0
    -- 1	0110	0001	0	0	0101	1	0	0
    -- 1	0110	0010	0	0	0100	1	0	0
    -- 1	0110	0011	0	0	0011	1	0	0
    -- 1	0110	0100	0	0	0010	1	0	0
    -- 1	0110	0101	0	0	0001	1	0	0
    -- 1	0110	0110	0	0	0000	0	0	1
    -- 1	0110	0111	0	1	1111	0	1	0
    -- 1	0110	1000	0	1	1110	0	1	0
    -- 1	0110	1001	0	1	1101	0	1	0
    -- 1	0110	1010	0	1	1100	0	1	0
    -- 1	0110	1011	0	1	1011	0	1	0
    -- 1	0110	1100	0	1	1010	0	1	0
    -- 1	0110	1101	0	1	1001	0	1	0
    -- 1	0110	1110	0	1	1000	0	1	0
    -- 1	0110	1111	0	1	0111	0	1	0
    -- 1	0111	0000	0	0	0100	1	0	0
    -- 1	0111	0001	0	0	0110	1	0	0
    -- 1	0111	0010	0	0	0010	1	0	0
    -- 1	0111	0011	0	0	0100	1	0	0
    -- 1	0111	0100	0	0	0000	1	0	0
    -- 1	0111	0101	0	0	0010	1	0	0
    -- 1	0111	0110	0	1	1110	0	1	0
    -- 1	0111	0111	0	0	0000	0	0	1
    -- 1	0111	1000	0	1	1100	0	1	0
    -- 1	0111	1001	0	1	1110	0	1	0
    -- 1	0111	1010	0	1	1010	0	1	0
    -- 1	0111	1011	0	1	1100	0	1	0
    -- 1	0111	1100	0	1	1000	0	1	0
    -- 1	0111	1101	0	1	1010	0	1	0
    -- 1	0111	1110	0	1	0110	0	1	0
    -- 1	0111	1111	0	1	1000	0	1	0
    -- 1	1000	0000	0	0	1000	1	0	0
    -- 1	1000	0001	0	0	0111	1	0	0
    -- 1	1000	0010	0	0	0110	1	0	0
    -- 1	1000	0011	0	0	0101	1	0	0
    -- 1	1000	0100	0	0	0100	1	0	0
    -- 1	1000	0101	0	0	0011	1	0	0
    -- 1	1000	0110	0	0	0010	1	0	0
    -- 1	1000	0111	0	0	0001	1	0	0
    -- 1	1000	1000	0	0	0000	0	0	1
    -- 1	1000	1001	0	1	1111	0	1	0
    -- 1	1000	1010	0	1	1110	0	1	0
    -- 1	1000	1011	0	1	1101	0	1	0
    -- 1	1000	1100	0	1	1100	0	1	0
    -- 1	1000	1101	0	1	1011	0	1	0
    -- 1	1000	1110	0	1	1010	0	1	0
    -- 1	1000	1111	0	1	1001	0	1	0
    -- 1	1001	0000	0	0	0110	1	0	0
    -- 1	1001	0001	0	0	1000	1	0	0
    -- 1	1001	0010	0	0	0100	1	0	0
    -- 1	1001	0011	0	0	0110	1	0	0
    -- 1	1001	0100	0	0	0010	1	0	0
    -- 1	1001	0101	0	0	0100	1	0	0
    -- 1	1001	0110	0	0	0000	1	0	0
    -- 1	1001	0111	0	0	0010	1	0	0
    -- 1	1001	1000	0	1	1110	0	1	0
    -- 1	1001	1001	0	0	0000	0	0	1
    -- 1	1001	1010	0	1	1100	0	1	0
    -- 1	1001	1011	0	1	1110	0	1	0
    -- 1	1001	1100	0	1	1010	0	1	0
    -- 1	1001	1101	0	1	1100	0	1	0
    -- 1	1001	1110	0	1	1000	0	1	0
    -- 1	1001	1111	0	1	1010	0	1	0
    -- 1	1010	0000	0	0	1010	1	0	0
    -- 1	1010	0001	0	0	1001	1	0	0
    -- 1	1010	0010	0	0	1000	1	0	0
    -- 1	1010	0011	0	0	0111	1	0	0
    -- 1	1010	0100	0	0	0110	1	0	0
    -- 1	1010	0101	0	0	0101	1	0	0
    -- 1	1010	0110	0	0	0100	1	0	0
    -- 1	1010	0111	0	0	0011	1	0	0
    -- 1	1010	1000	0	0	0010	1	0	0
    -- 1	1010	1001	0	0	0001	1	0	0
    -- 1	1010	1010	0	0	0000	0	0	1
    -- 1	1010	1011	0	1	1111	0	1	0
    -- 1	1010	1100	0	1	1110	0	1	0
    -- 1	1010	1101	0	1	1101	0	1	0
    -- 1	1010	1110	0	1	1100	0	1	0
    -- 1	1010	1111	0	1	1011	0	1	0
    -- 1	1011	0000	0	0	1000	1	0	0
    -- 1	1011	0001	0	0	1010	1	0	0
    -- 1	1011	0010	0	0	0110	1	0	0
    -- 1	1011	0011	0	0	1000	1	0	0
    -- 1	1011	0100	0	0	0100	1	0	0
    -- 1	1011	0101	0	0	0110	1	0	0
    -- 1	1011	0110	0	0	0010	1	0	0
    -- 1	1011	0111	0	0	0100	1	0	0
    -- 1	1011	1000	0	0	0000	1	0	0
    -- 1	1011	1001	0	0	0010	1	0	0
    -- 1	1011	1010	0	1	1110	0	1	0
    -- 1	1011	1011	0	0	0000	0	0	1
    -- 1	1011	1100	0	1	1100	0	1	0
    -- 1	1011	1101	0	1	1110	0	1	0
    -- 1	1011	1110	0	1	1010	0	1	0
    -- 1	1011	1111	0	1	1100	0	1	0
    -- 1	1100	0000	0	0	1100	1	0	0
    -- 1	1100	0001	0	0	1011	1	0	0
    -- 1	1100	0010	0	0	1010	1	0	0
    -- 1	1100	0011	0	0	1001	1	0	0
    -- 1	1100	0100	0	0	1000	1	0	0
    -- 1	1100	0101	0	0	0111	1	0	0
    -- 1	1100	0110	0	0	0110	1	0	0
    -- 1	1100	0111	0	0	0101	1	0	0
    -- 1	1100	1000	0	0	0100	1	0	0
    -- 1	1100	1001	0	0	0011	1	0	0
    -- 1	1100	1010	0	0	0010	1	0	0
    -- 1	1100	1011	0	0	0001	1	0	0
    -- 1	1100	1100	0	0	0000	0	0	1
    -- 1	1100	1101	0	1	1111	0	1	0
    -- 1	1100	1110	0	1	1110	0	1	0
    -- 1	1100	1111	0	1	1101	0	1	0
    -- 1	1101	0000	0	0	1010	1	0	0
    -- 1	1101	0001	0	0	1100	1	0	0
    -- 1	1101	0010	0	0	1000	1	0	0
    -- 1	1101	0011	0	0	1010	1	0	0
    -- 1	1101	0100	0	0	0110	1	0	0
    -- 1	1101	0101	0	0	1000	1	0	0
    -- 1	1101	0110	0	0	0100	1	0	0
    -- 1	1101	0111	0	0	0110	1	0	0
    -- 1	1101	1000	0	0	0010	1	0	0
    -- 1	1101	1001	0	0	0100	1	0	0
    -- 1	1101	1010	0	0	0000	1	0	0
    -- 1	1101	1011	0	0	0010	1	0	0
    -- 1	1101	1100	0	1	1110	0	1	0
    -- 1	1101	1101	0	0	0000	0	0	1
    -- 1	1101	1110	0	1	1100	0	1	0
    -- 1	1101	1111	0	1	1110	0	1	0
    -- 1	1110	0000	0	0	1110	1	0	0
    -- 1	1110	0001	0	0	1101	1	0	0
    -- 1	1110	0010	0	0	1100	1	0	0
    -- 1	1110	0011	0	0	1011	1	0	0
    -- 1	1110	0100	0	0	1010	1	0	0
    -- 1	1110	0101	0	0	1001	1	0	0
    -- 1	1110	0110	0	0	1000	1	0	0
    -- 1	1110	0111	0	0	0111	1	0	0
    -- 1	1110	1000	0	0	0110	1	0	0
    -- 1	1110	1001	0	0	0101	1	0	0
    -- 1	1110	1010	0	0	0100	1	0	0
    -- 1	1110	1011	0	0	0011	1	0	0
    -- 1	1110	1100	0	0	0010	1	0	0
    -- 1	1110	1101	0	0	0001	1	0	0
    -- 1	1110	1110	0	0	0000	0	0	1
    -- 1	1110	1111	0	1	1111	0	1	0
    -- 1	1111	0000	0	0	1100	1	0	0
    -- 1	1111	0001	0	0	1110	1	0	0
    -- 1	1111	0010	0	0	1010	1	0	0
    -- 1	1111	0011	0	0	1100	1	0	0
    -- 1	1111	0100	0	0	1000	1	0	0
    -- 1	1111	0101	0	0	1010	1	0	0
    -- 1	1111	0110	0	0	0110	1	0	0
    -- 1	1111	0111	0	0	1000	1	0	0
    -- 1	1111	1000	0	0	0100	1	0	0
    -- 1	1111	1001	0	0	0110	1	0	0
    -- 1	1111	1010	0	0	0010	1	0	0
    -- 1	1111	1011	0	0	0100	1	0	0
    -- 1	1111	1100	0	0	0000	1	0	0
    -- 1	1111	1101	0	0	0010	1	0	0
    -- 1	1111	1110	0	1	1110	0	1	0
    -- 1	1111	1111	0	0	0000	0	0	1
    -- 
-- 