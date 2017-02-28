//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 04 - Exemplo 001
//@Matricula: 420139
//----------------

module meiaSomaNand;
reg e1, e2;
wire stemp1, stemp2, stemp3, stemp4, sResp1, sResp2;

nand NAND1(stemp1, e1, e2);
nand NAND2(stemp2, stemp1, e1);
nand NAND3(stemp3, stemp1, e2);
nand NAND4(sResp1, stemp2, stemp3);

nand NAND5(stemp4, e1, e2);
nand NAND6(sResp2, stemp4, stemp4);

initial begin: start
	e1 = 0;
	e2 = 0;
end

initial begin: main
	$display("Guia 04 - Exemplo 01");
      $display("Meio Somador - NAND");
		$display("e1 + e2 = S|C");
		$monitor("(%b + %b) = %b %b", e1, e2, sResp1, sResp2);
		
		#1 e1 = 0; e2 = 1;
		#1 e1 = 1; e2 = 0;
		#1 e1 = 1; e2 = 1;
		
end

endmodule

//---Guia 04 - Exemplo 01
//---Meio Somador - NAND
//--- e1 + e2 = S|C
//--- (0 + 0) = 0 0
//--- (0 + 1) = 1 0
//--- (1 + 0) = 1 0
//--- (1 + 1) = 0 1
