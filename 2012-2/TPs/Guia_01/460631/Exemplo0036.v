// Projetar e simular LU
// Wadson Ferreira
// 460631

module NOT(output s,input a);
	not N1(s,a);
endmodule

module OR(output s, input a, input b, input c,input d);
	or O1(s,a,b,c);
endmodule

module AND(output s, input a, input b, input c, input d);
	and A1(s,a,b,c,d);
endmodule

module XNOR(output s, input a, input b, input c, input d);
	xnor X1(s,a,b,c,d);
endmodule

module comparar(output s, input[1:0] a, input[1:0] b, input select);
	wire nota;//negação de a[1]
	wire notb;//negação de a[0]
	wire notc;//negação de b[1]
	wire notd;//negação de b[0]
	wire anda;//and(nota,a[0],notc,b[0])
	wire andb;//and(a[1],notb,b[1],notd)
	wire andc;//and(nota,notb,notc,notd)
	wire andd;//and(a[1],a[0],b[1],b[0])
	wire result;//or(anda,andb,andc,andd)
	wire notresult;//negação da linha acima
	NOT NA(nota,a[1]);
	NOT NB(notb,a[0]);
	NOT NC(notc,b[1]);
	NOT ND(notd,b[0]);
	AND A1(anda,nota,a[0],notc,b[0]);
	AND A2(andb,a[1],notb,b[1],notd);
	AND A3(andc,nota,notb,notc,notd);
	AND A4(andd,a[0],a[1],b[0],b[1]);
	OR O1(result,anda,andb,andc,andd);
	NOT NE(notresult,result);
	assign s = (select==0) ? result : notresult;
endmodule

module teste;
	wire saida;
	reg[1:0] entradaA,entradaB;
	reg select; //0= 1!=
	comparar C1(saida,entradaA,entradaB,select);
	initial begin
	$display("\nWadson Ferreira - 460631");
	$display("A=Entrada B=Entrada S=Tipo(0>igual 1>diferente) R=Resultado\n");
	$monitor("A=%2b B=%2b S=%b R=%b",entradaA,entradaB,select,saida);
	
	#1 $display("Mostrando R=1 se forem iguais.");
	#1 entradaA=2'b00; entradaB=2'b00; select=1'b0;
	#1 entradaA=2'b00; entradaB=2'b01; select=1'b0;
	#1 entradaA=2'b00; entradaB=2'b10; select=1'b0;
	#1 entradaA=2'b00; entradaB=2'b11; select=1'b0;
	#1 entradaA=2'b01; entradaB=2'b00; select=1'b0;
	#1 entradaA=2'b01; entradaB=2'b01; select=1'b0;
	#1 entradaA=2'b01; entradaB=2'b10; select=1'b0;
	#1 entradaA=2'b01; entradaB=2'b11; select=1'b0;
	#1 entradaA=2'b10; entradaB=2'b00; select=1'b0;
	#1 entradaA=2'b10; entradaB=2'b01; select=1'b0;
	#1 entradaA=2'b10; entradaB=2'b10; select=1'b0;
	#1 entradaA=2'b10; entradaB=2'b11; select=1'b0;
	#1 entradaA=2'b11; entradaB=2'b00; select=1'b0;
	#1 entradaA=2'b11; entradaB=2'b01; select=1'b0;
	#1 entradaA=2'b11; entradaB=2'b10; select=1'b0;
	#1 entradaA=2'b11; entradaB=2'b11; select=1'b0;
	#1 $display("Não consegui fazer essa ultima linha funcionar.");

	#1 $display("Mostrando R=1 se forem diferentes.");
	#1 entradaA=2'b00; entradaB=2'b00; select=1'b1;
	#1 entradaA=2'b00; entradaB=2'b01; select=1'b1;
	#1 entradaA=2'b00; entradaB=2'b10; select=1'b1;
	#1 entradaA=2'b00; entradaB=2'b11; select=1'b1;
	#1 entradaA=2'b01; entradaB=2'b00; select=1'b1;
	#1 entradaA=2'b01; entradaB=2'b01; select=1'b1;
	#1 entradaA=2'b01; entradaB=2'b10; select=1'b1;
	#1 entradaA=2'b01; entradaB=2'b11; select=1'b1;
	#1 entradaA=2'b10; entradaB=2'b00; select=1'b1;
	#1 entradaA=2'b10; entradaB=2'b01; select=1'b1;
	#1 entradaA=2'b10; entradaB=2'b10; select=1'b1;
	#1 entradaA=2'b10; entradaB=2'b11; select=1'b1;
	#1 entradaA=2'b11; entradaB=2'b00; select=1'b1;
	#1 entradaA=2'b11; entradaB=2'b01; select=1'b1;
	#1 entradaA=2'b11; entradaB=2'b10; select=1'b1;
	#1 entradaA=2'b11; entradaB=2'b11; select=1'b1;
end
endmodule
