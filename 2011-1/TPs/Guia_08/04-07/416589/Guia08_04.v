// ---------------------
// Guia 08_04 - Simplicação de circuitos por Quine-McCluskey
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- Ex_04
// -------------------------------

module ex04 (s,a,b,c,d);
output s;
input a,b,c,d;

nand NAND1 (an,a,a);
nand NAND1 (cn,c,c);
nand NAND1 (temp1,a,cn,d);
nand NAND1 (temp2,an,c);
nand NAND1 (temp3,b,d);
nand NAND1 (temp4,c,b);
nand NAND1 (temp5,temp1,temp2);
nand NAND1 (temp6,temp3,temp4);
nand NAND1 (temp7,temp5,temp5);
nand NAND1 (temp8,temp6,temp6);
nand NAND1 (s,temp7,temp8);

endmodule // ex04

// -----------------------------
// -- test Ex04
// -----------------------------

module test;
 reg a,b,c,d;
 wire s;
           
// instancia
ex04 EX04(s,a,b,c,d);
 
initial begin:start
      a=0;b=0;c=0;d=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 08_04 - Alyson Deives - 416589");
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
    // -- Guia 08_04 - Alyson Deives - 416589
    // -- Simplificação de Circuitos por Quine McCluskey
    // -- 
    // -- 
//     -- A B C D | S  
//     -- 
//     -- 0 0 0 0 | 0
//     -- 0 0 0 1 | 0
//     -- 0 0 1 0 | 1
//     -- 0 0 1 1 | 1
//     -- 0 1 0 0 | 0
//     -- 0 1 0 1 | 1
//     -- 0 1 1 0 | 1
//     -- 0 1 1 1 | 1
//     -- 1 0 0 0 | 0
//     -- 1 0 0 1 | 1
//     -- 1 0 1 0 | 0
//     -- 1 0 1 1 | 0
//     -- 1 1 0 0 | 0
//     -- 1 1 0 1 | 1
//     -- 1 1 1 0 | 1
//     -- 1 1 1 1 | 1