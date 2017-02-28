//------------------------------
// Guia_05 - Ex04
// Guilherme Lucindo dos Santos
// 380766
//------------------------------

//--------------------
//--Meia Soma com NAND
//--------------------

module meiasoma (s, s0, p, q);

output s,s0;
input p, q;
wire s1, s2, s3, s4, s5;

nand NAND1(s1, p, p);
nand NAND2(s2, q, q);
nand NAND3(s3, s1, q);
nand NAND4(s4, p, s2);
nand NAND5(s, s3, s4);
nand NAND6(s5, p, q);
nand NAND7(s0, s5, s5);

endmodule // meiasoma

//-------------------------
//-- soma completa com NAND
//-------------------------

module somacompleta (s, s0, p, q, r);

output s, s0;
wire s1, s2, s3, s4, s5;
input p, q, r;

meiasoma M1(s1, s2, p, q);
meiasoma M2(s, s3, s1, r);
nand NAND1(s4, s1, s2);
nand NAND2(s5, s4, s4);
nand NAND3(s0, s4, s5);

endmodule // somacompleta

//------------
//-- teste
//------------

module  testesoma;

reg [2:0]A;
reg [2:0]B;
wire [3:0]C;
wire [1:0]D;

meiasoma M1(C[0], D[0], A[0], B[0]);
somacompleta S1(C[1], D[1], A[1], B[1], D[0]);
somacompleta S1(C[2], D[3], A[2], B[2], D[1]);


initial begin:main
	$display("Guia 05 - Guilherme Lucindo - 380766");
	$display("Exercicio 4");
	$display("\n a - b = s \n");
	
	A = 0;
	B = 0;
	
	while(a != 7)
	  begin
	   A = (B == 0)? A : A + 1;
		B = 0;
 
 #1		$display("%b + %b = %b", A, B, S);
         while(B != 7)
           begin
			   B = B + 1;
 #1		      $display("%b + %b = %b" A, B, S);  
           end 
       end
  end
 endmodule