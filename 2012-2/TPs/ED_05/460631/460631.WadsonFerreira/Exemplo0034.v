//Decrementar 1 (Extra-01)
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

module SomaSub(output[2:0] s, output co, input ci, input[2:0] a, input[2:0] b);
	wire co0,co1;
	wire xora, xorb, xorc;
	xor X1(xora,ci,b[0]);
	xor X2(xorb,ci,b[1]);
	xor X3(xorc,ci,b[2]);
	S1 SA(s[0],co0,ci,a[0],xora);
	S1 SB(s[1],co1,co0,a[1],xorb);
	S1 SC(s[2],co,co1,a[2],xorc);
endmodule

module decrementar(output[2:0] s, input[2:0] a);
	SomaSub SS(s,co,1'b1,a,3'b001);
endmodule

module teste;
	wire[2:0] saida;
	reg[2:0] entrada;
	decrementar I(saida,entrada);
	initial begin
		#1 entrada=3'b000;
		#1 $display("Incrementar 1");
		   $monitor("A=%3b S=%3b",entrada,saida);
		#1 entrada=3'b001;
		#1 entrada=3'b010;
		#1 entrada=3'b011;
		#1 entrada=3'b100;
		#1 entrada=3'b101;
		#1 entrada=3'b110;
		#1 entrada=3'b111;	
	end
endmodule
