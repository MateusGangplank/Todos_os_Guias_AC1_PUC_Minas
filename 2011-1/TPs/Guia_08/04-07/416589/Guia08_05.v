// ---------------------
// Guia 08_05 - Simplicação de circuitos por Quine-McCluskey
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- Ex_05
// -------------------------------

module ex05 (s,a,b,c,d);
output s;
input a,b,c,d;

nor NOR1 (temp1,a,a);
nor NOR2 (temp2,b,temp1);
nor NOR3 (temp14,temp2,temp2);
nor NOR4 (temp3,temp14,c);
nor NOR5 (temp4,a,d);
nor NOR6 (temp5,a,temp4);
nor NOR7 (temp6,d,temp4);
nor NOR8 (temp7,temp5,temp6);
nor NOR9 (temp8,a,a);
nor NOR10 (temp9,b,b);
nor NOR11 (temp10,temp8,temp9);
nor NOR12 (temp11,temp10,temp10);
nor NOR13 (temp12,d,d);
nor NOR14 (temp13,temp11,temp12);
nor NOR15 (temp15,temp3,temp7,temp13);
nor NOR16 (s,temp15,temp15);

endmodule // ex05

// -----------------------------
// -- test Ex05
// -----------------------------

module test;
 reg a,b,c,d;
 wire s;
           
// instancia
ex05 EX05(s,a,b,c,d);
 
initial begin:start
      a=0;b=0;c=0;d=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 08_05 - Alyson Deives - 416589");
      $display("Simplificação de Circuitos por Quine McCluskey\n");
		$display("\nA B C D | S  \n");
		$monitor("%b %b %b %b | %b", a,b,c,d,s); 
  
  		#1 a=0;b=0;c=0;d=0;
		#1 a=0;b=0;c=0;d=1;
		#1 a=0;b=0;c=1;d=0;
		#1 a=0;b=0;c=1;d=1;
		#1 a=0;b=1;c=0;d=0;
		#1 a=0;b=1;c=0;d=1;
		#1 a=0;b=1;c=1;d=0;
		#1 a=0;b=1;c=1;d=1;
		#1 a=1;b=0;c=0;d=0;
		#1 a=1;b=0;c=0;d=1;
		#1 a=1;b=0;c=1;d=0;
		#1 a=1;b=0;c=1;d=1;
		#1 a=1;b=1;c=0;d=0;
		#1 a=1;b=1;c=0;d=1;
		#1 a=1;b=1;c=1;d=0;
		#1 a=1;b=1;c=1;d=1;
end		
endmodule // test

	 // -----------------------------
	 // -- TESTE
	 // -----------------------------
    // -- Guia 08_05 - Alyson Deives - 416589
    // -- Simplificação de Circuitos por Quine McCluskey
    // -- 
    // -- 
//     -- A B C D | S  
//     -- 
//     -- 0 0 0 0 | 1
//     -- 0 0 0 1 | 0
//     -- 0 0 1 0 | 1
//     -- 0 0 1 1 | 0
//     -- 0 1 0 0 | 1
//     -- 0 1 0 1 | 0
//     -- 0 1 1 0 | 1
//     -- 0 1 1 1 | 0
//     -- 1 0 0 0 | 1
//     -- 1 0 0 1 | 1
//     -- 1 0 1 0 | 0
//     -- 1 0 1 1 | 1
//     -- 1 1 0 0 | 0
//     -- 1 1 0 1 | 1
//     -- 1 1 1 0 | 0
//     -- 1 1 1 1 | 1