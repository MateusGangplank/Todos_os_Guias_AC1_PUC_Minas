// ---------------------
// Guia 08_02 - Simplicação de circuitos por Quine-McCluskey
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- Ex_02
// -------------------------------

module ex02 (s,a,b,c,d);
output s;
input a,b,c,d;

not NOT1 (bn,b);
not NOT2 (cn,c);
and AND1 (temp1,a,bn,cn);
and AND2 (temp3,a,b,d);
xnor XNOR1 (temp2,a,d);
or OR1 (s,temp1,temp2,temp3);

endmodule // ex02

// -----------------------------
// -- test Ex02
// -----------------------------

module test;
 reg a,b,c,d;
 wire s;
           
// instancia
ex02 EX02(s,a,b,c,d);
 
initial begin:start
      a=0;b=0;c=0;d=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 08_02 - Alyson Deives - 416589");
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
    // -- Guia 08_02 - Alyson Deives - 416589
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