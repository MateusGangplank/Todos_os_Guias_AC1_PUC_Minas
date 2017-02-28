// Guia 05
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module operadorMS ( s4, s3, a, b);
output s4, s3;
input a, b;

xor XOR2(s4,a,b);
and AND2(s3,a,b);

endmodule

module operadorSC ( s0, s1, a, b, v1 );
output s0, s1;
input a, b, v1;
wire s3, s4;

operadorMS MS1(s4,s3,a,b);
operadorMS MS2( s0, s2 ,v1 ,s4);
or OR1(s1,s2,s3);

endmodule


module operadorS4bits (s0,s1,a,b);
output[4:0]s;
input[3:0]a,b;
wire[2:0]c;

operadorMS MS1(s[0],c[0],a[0],b[0]);
operadorSC SC1(s[1],c[1],a[1],b[1],c[0]);
operadorSC SC2(s[2],c[2],a[2],b[2],c[1]);
operadorSC SC3(s[3],s[4],a[3],b[3],c[2]);

endmodule

module M3Bits(s,s0,s1,a,b);
output[5:0]s;
input[3:0]a,b;
wire[4:0]c;

and AND1(s0,a[0],b[0]);
and AND2(c[0],a[0],b[1]);
and AND3(c[1],a[1],b[1]);
and AND4(c[2],a[2],b[1]);
and AND5(c[3],0,0);
and AND6(c[0],a[1],b[0]);
and AND7(c[1],0,0);
and AND7(c[2],0,0);
and AND9(c[3],a[2],b[1]);
and AND10(c[0],a[2],b[2]);
and AND11(c[1],a[1],b[2]);
and AND12(c[2],a[0],b[2]);
and AND13(c[3],0,0);


operadorS4bits S4bits1(s0,c,a,b);
operadorS4bits S4bits2(s,s1,s0,c1);


endmodule

module testM3Bits;
reg [3:0]a,b;
wire [4:0]s;
integer i,j;
 

M3Bits M3B(s,s0,s1,a,b);

initial begin: start
		a=0; b=0;
end


	initial begin:main

		$display("Produto Completo - 3 bits ");
		#1 $display(" a +  b = s1   s0 ");
		#1 $monitor(" %4b + %4b = %b    %4b %b", a,b,s1,s,s0);

		for( i=0; i<=7; i = i+1 )
		begin
			a = i;
			for ( j=0; j<=7; j = j+1 )
			begin
				#1 b = j;
			end
		end

	end

endmodule
