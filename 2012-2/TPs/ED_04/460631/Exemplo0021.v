//Somador 3 bits (Sem verificação de overflow)
//Wadson Ferreira
//460631

module S1(output soma,output co,input ci, input a, input b);
	wire xora,anda,andb;
	xor X1(xora,ci,a);
	xor X2(soma,xora,b);
	and  A1(anda,xora,b);
	and  A2(andb,ci,a);
	or   O1(co,anda,andb);
endmodule

module S3(output[2:0] soma, output co, input ci, input[2:0] a, input[2:0] b);
	wire co0, co1;
	S1 SA(soma[0],co0,ci,a[0],b[0]);
	S1 SB(soma[1],co1,co0,a[1],b[1]);
	S1 SC(soma[2],co,co1,a[2],b[2]);
endmodule

module teste;
	wire[2:0] soma;
	wire co;
	reg[2:0] entradaA, entradaB;
	reg ci;
	S3 SA(soma,co,ci,entradaA,entradaB);
	initial begin
	$display("Somador");
	#1 entradaA=3'b000; entradaB=3'b000; ci=0;
	#1 $monitor("A=%3b B=%3b CI=%b SOMA=%3b CO=%b",entradaA,entradaB,ci,soma,co);
	#1 entradaA=3'b100; entradaB=3'b010; ci=0;
	#1 entradaA=3'b111; entradaB=3'b000; ci=0;
	#1 entradaA=3'b111; entradaB=3'b001; ci=0;
	#1 entradaA=3'b111; entradaB=3'b001; ci=1;
	#1 entradaA=3'b000; entradaB=3'b000; ci=1;
	#1 entradaA=3'b010; entradaB=3'b001; ci=1;
	#1 entradaA=3'b011; entradaB=3'b011; ci=1;
	#1 entradaA=3'b111; entradaB=3'b111; ci=0;
	#1 entradaA=3'b100; entradaB=3'b100; ci=0;
	end
endmodule
