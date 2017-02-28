//Comparador (Forma Aritmética)(Extra-02)
//Wadson Ferreira
//460631 
module S1(output s, output co, input ci,input a, input b);
	wire xora,anda,andb;
	xor X1(xora,a,b);
	and A1(anda,a,b);
	xor X2(s,xora,ci);
	and A2(andb,xora,ci);
	or  O1(co,anda,andb);
endmodule

//sinal[2:0] => [2] sinal de a, [1] sinal de b, [0] sinal de s
module SomaSub(output[2:0] s, output co, output over, output flag, output[2:0] sinal, input ci, input[2:0] a, input[2:0] b);
	wire co0,co1;
	wire xora, xorb, xorc;
	xor X1(xora,ci,b[0]);
	xor X2(xorb,ci,b[1]);
	xor X3(xorc,ci,b[2]);
	S1 SA(s[0],co0,ci,a[0],xora);
	S1 SB(s[1],co1,co0,a[1],xorb);
	S1 SC(s[2],co,co1,a[2],xorc);
	//verificaçao do over
	wire anda, andb, nota, notb, notc;
	not N1(nota, ci);
	not N2(notb, a[2]);
	not N3(notc, b[2]);
	and A1(anda,nota,notb,notc,s[2]);
	and A2(andb,notb,ci,b[2],s[2]);
	or  O1(over,anda,andb);
	//identificação do sinal
	assign sinal[2] = a[2];
	assign sinal[1] = b[2];
	assign sinal[0] = s[2];
	//zero flag
	nor (flag,s[2],s[1],s[0]);
endmodule

module comparador(output s1, output s2, output s3, input[2:0] a, input[2:0] b);
	wire[2:0] sinal;
	wire zero;
	wire[2:0] resposta;
	SomaSub SS(resposta,co,over,zero,sinal,1'b1,a,b);
	wire notA, notB, notS, notFlag;
	not N1(notA,sinal[2]);
	not N2(notB,sinal[1]);
	not N3(notC,sinal[0]);
	not N4(notFlag,zero);
	wire anda,andb,andc,andd,ande,andf;
	and A1(anda,notA,notB,notC,notFlag);
	and A2(andb,notA,notB,sinal[0]);
	and A3(andc,sinal[2],sinal[1],sinal[0]);
	and A4(andd,sinal[2],sinal[1],notC,notFlag);
	and A5(ande,sinal[2],notB);
	and A6(andf,sinal[1],notA);
	wire org,orh;
	or O1(org,anda,andd,andf);
	or O2(orh,andb,andc,ande);
	assign s1 = org;
	assign s2 = zero;
	assign s3 = orh;
endmodule

//100 para A>B
//010 para A=B
//001 para A<B

module teste;
	wire s1,s2,s3;
	reg[2:0] entradaA,entradaB;
	comparador C(s1,s2,s3,entradaA,entradaB);
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
