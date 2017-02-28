//----------------
//@autor: Rafael de Freitas Queiroz Matosinhos
//@Guia 03 - Exemplo 002
//@Matricula: 420139
//----------------

//----------------
//--- NAND GATE ---
//----------------

module nandgate (s1, e1, e2);
   output s1;
   input  e1, e2;
	assign s1 = ~(e1&e2);
endmodule


module meioSomador;
reg e1, e2;
wire sResp1, sResp2, sTemp1, sTemp2, sTemp3, sTemp4, sTemp5, sTemp6, sTemp7;

nandgate NAND1(sTemp1, e1, e2);
nandgate NAND2(sTemp2, sTemp1, e1);
nandgate NAND3(sTemp3, sTemp1, e2);
nandgate NAND4(sResp2, sTemp2, sTemp3);

nandgate NAND5(sTemp4, e1, e2);
nandgate NAND6(sTemp5, sTemp4, sTemp4);
nandgate NAND7(sTemp6, sTemp5, sTemp5);
nandgate NAND8(sTemp7, sTemp5, sTemp5);
nandgate NAND9(sResp1, sTemp6, sTemp7);

initial begin: start
 	e1 = 0;
 	e2 = 0;
end

initial begin: main

$display("Guia 03 - Exemplo 02");
      $display("Meio Somador - NAND");
		$monitor("(%b + %b) = %b %b", e1, e2, sResp1, sResp2);
		
		#1 e1 = 0; e2 = 1;
		#1 e1 = 1; e2 = 0;
		#1 e1 = 1; e2 = 1;
		
end
	
endmodule


//---- TESTES -----
//--Guia 03 - Exemplo 02
//--Meio Somador - NAND
//--(0 + 0) = 0 0
//--(0 + 1) = 0 1
//--(1 + 0) = 0 1
//--(1 + 1) = 1 0