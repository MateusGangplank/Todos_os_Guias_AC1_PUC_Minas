//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 04 - Exemplo 002
//@Matricula: 420139
//----------------

module meiaSomaNand(sResp1, sResp2, e1, e2);

output sResp1, sResp2;
input e1, e2;
wire stemp1, stemp2, stemp3, stemp4, sTemp5, sTemp6, sTemp7;

nand NAND1(sTemp1, e1, e2);
nand NAND2(sTemp2, sTemp1, e1);
nand NAND3(sTemp3, sTemp1, e2);
nand NAND4(sResp2, sTemp2, sTemp3);

nand NAND5(sTemp4, e1, e2);
nand NAND6(sTemp5, sTemp4, sTemp4);
nand NAND7(sTemp6, sTemp5, sTemp5);
nand NAND8(sTemp7, sTemp5, sTemp5);
nand NAND9(sResp1, sTemp6, sTemp7);


endmodule

module somaCompleta;
reg e1, e2, c1;
wire stemp1, stemp2, stemp3, sResp1, sResp2;

meiaSomaNand msNAND1(stemp1, stemp2, e1, e2);
meiaSomaNand msNAND2(sResp1, stemp3, stemp1, c1);
or OR1(sResp2, stemp3, stemp2);


initial begin: start
	e1 = 0;
	e2 = 0;
	
	c1 = 0;     // FALTOU DETERMINAR O VALOR INICIAL DO carry_in
end

initial begin: main
	$display("Guia 04 - Exemplo 02");
      $display("Somador Completo - NAND+OR");
		$display("e1 + e2 = S1|S2");
		$monitor("(%b + %b) = %b   %b", e1, e2, sResp1, sResp2);
		
		#1 e1 = 0; e2 = 1;
		#1 e1 = 1; e2 = 0;
		#1 e1 = 1; e2 = 1;
		
end

endmodule

//---N�O CONSEGUI FAZER FUNCIONAR CORRETAMENTE!
//---Guia 04 - Exemplo 02
//---Somador Completo - NAND+OR
//---e1 + e2 = S1|S2
//---(0 + 0) = 0   x
//---(0 + 1) = 0   1
//---(1 + 0) = 0   1
//---(1 + 1) = x   x
