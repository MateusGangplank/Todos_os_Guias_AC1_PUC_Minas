//Subtrator de 3bits (Sem verificação de overflow)
//Usando circuito de subtração
//Wadson Ferreira
//460631

module Sub1(output sub, output co, input ci, input a, input b);
	wire xora, anda, andb,notxora,nota;
	xor X1(xora,a,b);
	xor X2(sub,ci,xora);
	not N1(notxora,xora);
	and A1(anda,ci,notxora);
	not N2(nota,a);
	and A2(andb,b,nota);
	or  O1(co,anda,andb);
endmodule

module Sub3(output[2:0] s, output co, input ci, input[2:0] a, input[2:0] b);
	wire co0, co1;
	Sub1 S1(s[0],co0,ci,a[0],b[0]);
	Sub1 S2(s[1],co1,co0,a[1],b[1]);
	Sub1 S3(s[2],co,co1,a[2],b[2]);
endmodule

module teste;
	wire[2:0] subtracao;
	wire co;
	reg[2:0] entradaA, entradaB;
	reg ci;
	Sub3 SA(subtracao,co,ci,entradaA,entradaB);
	initial begin
	$display("Subtrator");
	#1 entradaA=3'b000; entradaB=3'b000; ci=1'b0;
	#1 $monitor("A=%3b B=%3b RESULTADO=%3b",entradaA,entradaB,subtracao);
	#1 entradaA=3'b100; entradaB=3'b010;
	#1 entradaA=3'b111; entradaB=3'b000;
	#1 entradaA=3'b111; entradaB=3'b111; 
	#1 entradaA=3'b000; entradaB=3'b001; 
	#1 entradaA=3'b000; entradaB=3'b111; 
	#1 entradaA=3'b111; entradaB=3'b111; 
	#1 entradaA=3'b011; entradaB=3'b011; 
	#1 entradaA=3'b001; entradaB=3'b001; 
	#1 entradaA=3'b100; entradaB=3'b100; 
	end
endmodule
