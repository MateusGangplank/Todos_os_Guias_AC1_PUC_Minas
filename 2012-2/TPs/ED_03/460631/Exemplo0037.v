//Maior e menor
//Wadson Ferreira
//460631
//(b*c'*d')+(a*c'*d')+(a*c'*d)+(a*b*c*d')
//OBS: Não foi possivel fazer com simplificação
module maior(output s, input[1:0] a, input[1:0] b, input chave);
	wire notc, notd;
	not N1(notc,b[1]);
	not N2(notd,b[0]);
	wire anda, andb, andc, andd;
	and A1(anda,a[0],notc,notd);
	and A2(andb,a[1],notc,notd);
	and A3(andc,a[1],notc,b[0]);
	and A4(andd,a[1],a[0],b[1],notd);
	wire ora;
	or O1(ora,anda,andb,andc,andd);
	wire andMaior, andMenor, chaveN, oraN;
	not N3(oraN,ora);
	not N4(chaveN,chave);
	and A5(andMaior,ora,chaveN);	
	and A6(andMenor,oraN,chave);
	or  O2(s,andMenor,andMaior);
endmodule

module teste;
	wire saida;
	reg[1:0] entradaA, entradaB;
	reg chave;
	maior M(saida,entradaA,entradaB,chave);
	initial begin
		#1 $display("0=entradaA>entradaB    1=entradaA<=entradaB");
		   $display("Mostrando para chave=0");
		#1 entradaA=2'b00; entradaB=2'b00; chave=0;
		#1 $monitor("A=%2b B=%2b Chave=%b Saida=%b",entradaA,entradaB,chave,saida);
		#1 entradaA=2'b00; entradaB=2'b00; chave=0;
		#1 entradaA=2'b00; entradaB=2'b01; chave=0;
		#1 entradaA=2'b00; entradaB=2'b10; chave=0;
		#1 entradaA=2'b00; entradaB=2'b11; chave=0;
		#1 entradaA=2'b01; entradaB=2'b00; chave=0;
		#1 entradaA=2'b01; entradaB=2'b01; chave=0;
		#1 entradaA=2'b01; entradaB=2'b10; chave=0;
		#1 entradaA=2'b01; entradaB=2'b11; chave=0;
		#1 entradaA=2'b10; entradaB=2'b00; chave=0;
		#1 entradaA=2'b10; entradaB=2'b01; chave=0;
		#1 entradaA=2'b10; entradaB=2'b10; chave=0;
		#1 entradaA=2'b10; entradaB=2'b11; chave=0;
		#1 entradaA=2'b11; entradaB=2'b00; chave=0;
		#1 entradaA=2'b11; entradaB=2'b01; chave=0;
		#1 entradaA=2'b11; entradaB=2'b10; chave=0;
		#1 entradaA=2'b11; entradaB=2'b11; chave=0;

		#1 $display("Mostrando para chave=1");
		#1 entradaA=2'b00; entradaB=2'b00; chave=1;
		#1 entradaA=2'b00; entradaB=2'b00; chave=1;
		#1 entradaA=2'b00; entradaB=2'b01; chave=1;
		#1 entradaA=2'b00; entradaB=2'b10; chave=1;
		#1 entradaA=2'b00; entradaB=2'b11; chave=1;
		#1 entradaA=2'b01; entradaB=2'b00; chave=1;
		#1 entradaA=2'b01; entradaB=2'b01; chave=1;
		#1 entradaA=2'b01; entradaB=2'b10; chave=1;
		#1 entradaA=2'b01; entradaB=2'b11; chave=1;
		#1 entradaA=2'b10; entradaB=2'b00; chave=1;
		#1 entradaA=2'b10; entradaB=2'b01; chave=1;
		#1 entradaA=2'b10; entradaB=2'b10; chave=1;
		#1 entradaA=2'b10; entradaB=2'b11; chave=1;
		#1 entradaA=2'b11; entradaB=2'b00; chave=1;
		#1 entradaA=2'b11; entradaB=2'b01; chave=1;
		#1 entradaA=2'b11; entradaB=2'b10; chave=1;
		#1 entradaA=2'b11; entradaB=2'b11; chave=1;

	end
endmodule
