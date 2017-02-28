// ---------------------
// Guia 08_03 - Simplicação de circuitos por Quine-McCluskey
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// -------------------------------
// -- Ex_03
// -------------------------------

module ex03 (s,a,b,c,d,e);
output s;
input a,b,c,d,e;

not NOT1 (bn,b);
not NOT2 (cn,c);
not NOT3 (dn,d);
xnor XNOR1 (temp1,a,c);
and AND1 (temp2,bn,e);
and AND2 (temp3,c,e);
and AND3 (temp4,a,bn,cn,d);
and AND3 (temp5,temp1,dn);
or OR1(s,temp2,temp3,temp4,temp5);

endmodule // ex03

// -----------------------------
// -- test Ex03
// -----------------------------

module test;
 reg a,b,c,d,e;
 wire s;
           
// instancia
ex03 EX03(s,a,b,c,d,e);
 
initial begin:start
      a=0;b=0;c=0;d=0;e=0;
 end
 
 
 // parte principal
 initial begin:main
      $display("Guia 08_03 - Alyson Deives - 416589");
      $display("Simplificação de Circuitos por Quine McCluskey\n");
		$display("\nA B C D E | S  \n");
		$monitor("%b %b %b %b %b | %b", a,b,c,d,e,s); 
  
  		#1 a=0;b=0;c=0;d=0;e=0;
		#1 a=0;b=0;c=0;d=0;e=1;
		#1 a=0;b=0;c=0;d=1;e=0;
		#1 a=0;b=0;c=0;d=1;e=1;
		#1 a=0;b=0;c=1;d=0;e=0;
		#1 a=0;b=0;c=1;d=0;e=1;
		#1 a=0;b=0;c=1;d=1;e=0;
		#1 a=0;b=0;c=1;d=1;e=1;
		#1 a=0;b=1;c=0;d=0;e=0;
		#1 a=0;b=1;c=0;d=0;e=1;
		#1 a=0;b=1;c=0;d=1;e=0;
		#1 a=0;b=1;c=0;d=1;e=1;
		#1 a=0;b=1;c=1;d=0;e=0;
		#1 a=0;b=1;c=1;d=0;e=1;
		#1 a=0;b=1;c=1;d=1;e=0;
		#1 a=0;b=1;c=1;d=1;e=1;
		#1 a=1;b=0;c=0;d=0;e=0;
		#1 a=1;b=0;c=0;d=0;e=1;
		#1 a=1;b=0;c=0;d=1;e=0;
		#1 a=1;b=0;c=0;d=1;e=1;
		#1 a=1;b=0;c=1;d=0;e=0;
		#1 a=1;b=0;c=1;d=0;e=1;
		#1 a=1;b=0;c=1;d=1;e=0;
		#1 a=1;b=0;c=1;d=1;e=1;
		#1 a=1;b=1;c=0;d=0;e=0;
		#1 a=1;b=1;c=0;d=0;e=1;
		#1 a=1;b=1;c=0;d=1;e=0;
		#1 a=1;b=1;c=0;d=1;e=1;
		#1 a=1;b=1;c=1;d=0;e=0;
		#1 a=1;b=1;c=1;d=0;e=1;
		#1 a=1;b=1;c=1;d=1;e=0;
		#1 a=1;b=1;c=1;d=1;e=1;
		
end		
endmodule // test

	 // -----------------------------
	 // -- TESTE
	 // -----------------------------
    // -- Guia 08_03 - Alyson Deives - 416589
    // -- Simplificação de Circuitos por Quine McCluskey
    // -- 
    // -- 
    // -- A B C D E | S  
    // -- 
    // -- 0 0 0 0 0 | 1
    // -- 0 0 0 0 1 | 1
    // -- 0 0 0 1 0 | 0
    // -- 0 0 0 1 1 | 1
    // -- 0 0 1 0 0 | 0
    // -- 0 0 1 0 1 | 1
    // -- 0 0 1 1 0 | 0
    // -- 0 0 1 1 1 | 1
    // -- 0 1 0 0 0 | 1
    // -- 0 1 0 0 1 | 1
    // -- 0 1 0 1 0 | 0
    // -- 0 1 0 1 1 | 0
    // -- 0 1 1 0 0 | 0
    // -- 0 1 1 0 1 | 1
    // -- 0 1 1 1 0 | 0
    // -- 0 1 1 1 1 | 1
    // -- 1 0 0 0 0 | 0
    // -- 1 0 0 0 1 | 1
    // -- 1 0 0 1 0 | 1
    // -- 1 0 0 1 1 | 1
    // -- 1 0 1 0 0 | 1
    // -- 1 0 1 0 1 | 1
    // -- 1 0 1 1 0 | 0
    // -- 1 0 1 1 1 | 1
    // -- 1 1 0 0 0 | 0
    // -- 1 1 0 0 1 | 0
    // -- 1 1 0 1 0 | 0
    // -- 1 1 0 1 1 | 0
    // -- 1 1 1 0 0 | 1
    // -- 1 1 1 0 1 | 1
    // -- 1 1 1 1 0 | 0
    // -- 1 1 1 1 1 | 1
