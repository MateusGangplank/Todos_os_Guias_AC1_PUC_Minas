// --------------------------
// Exemplo0016(extra) - NAND
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------


// --------------------------
// -- nand gate
// --------------------------
  module nandgate(output s, input m,n);
    assign s=~(m&n);
  endmodule // nandgate
  
  
// --------------------------
// -- test nand gate
// --------------------------
  module testnandgate;
  
  
// -------------------------- dados locais
  reg  x,y,w,z,a,b,c,d;
  wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22;
  
  
// -------------------------- instancia
  nandgate NAND1(s1,x,x);
  nandgate NAND2(s2,y,y);
  nandgate NAND3(s3,w,w);
  nandgate NAND4(s4,z,z);
  nandgate NAND5(s5,a,a);
  nandgate NAND6(s6,b,b);
  nandgate NAND7(s7,c,c);
  nandgate NAND8(s8,d,d);
  nandgate NAND9(s9,s1,s2);  
  nandgate NAND10(s10,s3,s4);
  nandgate NAND11(s11,s5,s6);
  nandgate NAND12(s12,s7,s8);
  nandgate NAND13(s13,s9,s9);
  nandgate NAND14(s14,s10,s10);
  nandgate NAND15(s15,s11,s11);
  nandgate NAND16(s16,s12,s12);
  nandgate NAND17(s17,s13,s14);
  nandgate NAND18(s18,s15,s16);
  nandgate NAND19(s19,s17,s17);
  nandgate NAND20(s20,s18,s18);
  nandgate NAND21(s21,s19,s20);
  nandgate NAND22(s22,s21,s21);

// -------------------------- preparacao
  initial begin:start
    x=0; y=0; w=0; z=0; a=0; b=0; c=0; d=0;
  end
  
  
// -------------------------- parte principal
  initial begin:main
    $display("Extras - Isabel Bicalho Amaro - 451580");
	 $display("Test NAND gate");
	 $display("\nx y w z a b c d  [(~x~y)(~w~z)][(~a~b)(~c~d)]\n");
	 $monitor("%b %b %b %b %b %b %b %b  %b",x,y,w,z,a,b,c,d,s22);
  #1 x=0; y=0; w=0; z=0; a=0; b=0; c=0; d=0;
  end
  
endmodule // testnandgate


// --    Extras - Isabel Bicalho Amaro - 451580
// --    Test NAND gate
// --    
// --    x y w z a b c d  [(~x~y)(~w~z)][(~a~b)(~c~d)]
// --    
// --    0 0 0 0 0 0 0 0  1