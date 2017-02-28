// Guia 08_05 - Circuito 02 utilizando apenas portas NOR
// Nome: Nádia de souza Maciel vieira ferriea
// Matricula: 414511
// -------------------------------------------------------------------------------------------------------------------------------

// REFAZER o circuito 02 utilizando apenas portas NOR.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module funcao (s0, a, b, c, d);

output s0;
input a, b, c, d;
wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25;

nor NOR1(s1, a, a);
nor NOR2(s2, b, b);
nor NOR4(s4, d, d);
nor NOR6(s5, s1);
nor NOR7(s6, s2);
nor NOR8(s7, s4);
nor NOR9(s8, s5, s6, s7);

nor NOR10(s1, a, a);
nor NOR11(s3, c, c);
nor NOR12(s4, d);
nor NOR13(s9, s1);
nor NOR14(s10, s3);
nor NOR15(s11, s4);
nor NOR16(s12, s9, s10, s11);

nor NOR17(s2, b);
nor NOR18(s3, c);
nor NOR19(s4, d);
nor NOR20(s13, s2);
nor NOR20(s14, s3);
nor NOR21(s15, s4);
nor NOR22(s16, s13, s14, s15);

nor NOR23(s1, a);
nor NOR24(s2, b);
nor NOR25(s4, d);
nor NOR20(s17, s1);
nor NOR26(s18, s2);
nor NOR27(s19, s4);
nor NOR28(s20, s17, s18, s19);

nor NOR29(s1, a);
nor NOR30(s3, c);
nor NOR31(s4, d);
nor NOR32(s21, s1);
nor NOR33(s22, s3);
nor NOR34(s23, s4);
nor NOR35(s24, s21, s22, s23);

nor NOR36(s25, s8, s12, s16, s20, s24);
nor NOR37(s0, s25);


endmodule 

module teste;

reg a, b, c, d;
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25;

funcao F2 (s0, a, b, c, d);

initial begin:start

a=0; b=0; c=0; d=0; 
end

initial begin: main
	$display("Guia 08 - nadia de souza maciel vieira ferreira");
	$monitor("%b %b %b %b = %b", a, b, c, d, s0);
		
	#1 a = 0; b = 0; c = 0; d = 1;
	#1 a = 0; b = 0; c = 1; d = 0;
	#1 a = 0; b = 0; c = 1; d = 1;
	#1 a = 0; b = 1; c = 0; d = 0;
	#1 a = 0; b = 1; c = 0; d = 1;
	#1 a = 0; b = 1; c = 1; d = 0;
	#1 a = 0; b = 1; c = 1; d = 1;
	#1 a = 1; b = 0; c = 0; d = 0;
	#1 a = 1; b = 0; c = 0; d = 1;
	#1 a = 1; b = 0; c = 1; d = 0;
	#1 a = 1; b = 0; c = 1; d = 1;
	#1 a = 1; b = 1; c = 0; d = 0;
	#1 a = 1; b = 1; c = 0; d = 1;
	#1 a = 1; b = 1; c = 1; d = 0;
	#1 a = 1; b = 1; c = 1; d = 1;
	
end

endmodule

/* Resultado obtido

 */