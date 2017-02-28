//Comparador (Forma Lógica) (Extra-02)
//Wadson Ferreira
//460631 

module C1(output s1, output s2, output s3, input a, input b);
	wire nota,notb;
	not N1(nota,a);
	not N2(notb,b);
	and A1(s1,a,notb);
	xnor X1(s2,a,b);
	and A2(s3,b,nota);
endmodule

module C3(output s1, output s2, output s3, input[2:0] a, input[2:0] b);
	wire As1, As2, As3;
	wire Bs1, Bs2, Bs3;
	wire Cs1, Cs2, Cs3;
	C1 A(As1,As2,As3,a[2],b[2]);
	C1 B(Bs1,Bs2,Bs3,a[1],b[1]);
	C1 C(Cs1,Cs2,Cs3,a[0],b[0]);
	wire anda, andb, andc, andd, ande;
	wire org, ori;
	wire xorf, xorh, xorj;
	and A1(anda,As2,Bs1);
	and A2(andb,As2,Bs3);
	and A3(andc,As2,Bs2,Cs1);
	and A4(andd,As2,Bs2,Cs2);
	and A5(ande,As2,Bs2,Cs3);
	xor X1(xorf,a[2],b[2]);
	or  O2(org,As1,anda,andc);
	or  O3(ori,As3,andb,ande);
	xor X2(xorh,xorf,org);
	xor X3(xorj,xorf,ori);
	assign s1 = xorh;
	assign s2 = andd;
	assign s3 = xorj;
endmodule

//100 para A>B
//010 para A=B
//001 para A<B

module teste;
	wire s1,s2,s3;
	reg[2:0] entradaA,entradaB;
	C3 C(s1,s2,s3,entradaA,entradaB);
	initial begin
		#1 entradaA=3'b100; entradaB=3'b000;
		#1 $display("Comparador\n(100)A>B, (010)A=B, (001)A<B");
		   $monitor("A=%3b B=%3b S=%b%b%b",entradaA,entradaB,s1,s2,s3);
		#1 entradaA=3'b100; entradaB=3'b100;
		#1 entradaA=3'b011; entradaB=3'b100;
		#1 entradaA=3'b111; entradaB=3'b110;
		#1 entradaA=3'b110; entradaB=3'b111;
		#1 entradaA=3'b000; entradaB=3'b111;
		#1 entradaA=3'b101; entradaB=3'b101;
		#1 entradaA=3'b001; entradaB=3'b001;
		#1 entradaA=3'b100; entradaB=3'b111;
	end
endmodule
