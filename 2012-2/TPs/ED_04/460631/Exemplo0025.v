//Complemento de 2
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
	wire nota2,nota1,nota0;
	not N1(nota2,a[2]);
	not N2(nota1,a[1]);
	not N3(nota0,a[0]);
	S1 SA(soma[0],co0,1'b1,nota0,1'b0);
	S1 SB(soma[1],co1,co0,nota1,1'b0);
	S1 SC(soma[2],co,co1,nota2,1'b0);
endmodule

module complemento(output[2:0] s, input[2:0] a);
	S3 SA(s,co,1'b0,a,3'b000);
endmodule

module teste;
	wire[2:0] saida;
	reg[2:0] entrada;
	complemento C2(saida,entrada);
	initial begin
		$display("Complemento 2 de A");
		#1 entrada=3'b000;
		#1 $monitor("A=%3b S=%3b",entrada,saida);
		#1 entrada=3'b001;
		#1 entrada=3'b111;
		#1 entrada=3'b010;
		#1 entrada=3'b011;
	end
endmodule
