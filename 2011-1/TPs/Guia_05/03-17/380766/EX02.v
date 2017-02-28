//------------------------------
// Guia_05 - Ex02
// Guilherme Lucindo dos Santos
// 380766
//------------------------------

//----------------
//--Meia diferença
//----------------

module meiadiferenca (s,s0, p, q);

output s,s0;
input p, q;

xor XOR1(s, p, q);
not NOT1(s1, p);
and AND1(s0, s1, q);

endmodule // meiadiferenca

//---------------------
//-- diferença completa
//---------------------

module somacompleta (s, s0, p, q, r);

output s, s0;
wire s1, s2, s3;
input p, q, r;

meiasoma M1(s1, s2, p, q);
meiasoma M2(s, s3, s1, r);
or OR1(s0, s2, s3);

endmodule // somacompleta

//------------
//-- teste
//------------

module  testesoma;

reg [2:0]A;
reg [2:0]B;
wire [3:0]C;
wire [1:0]D;

meiadiferenca M1(C[0], D[0], A[0], B[0]);
diferencacompleta S1(C[1], D[1], A[1], B[1], D[0]);
diferencacompleta S1(C[2], D[2], A[2], B[2], D[1]);


initial begin:main
	$display("Guia 05 - Guilherme Lucindo - 380766");
	$display("Exercicio 2");
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