module XORNANDS(diferenca,a,b);
input a,b;
output diferenca;


nand NAND1(temp1,a,b);
nand NAND2(temp2,temp1,b);
nand NAND3(temp3,temp1,a);
nand NAND4(diferenca,temp2,temp3);



 endmodule

module ORNANDS(temp2,a,b);

input a,b;
output temp2;


nand NAND1(temp1,a,a);
nand NAND1(temp3,a,b);
nand NAND2(temp2,temp1,temp3);

 endmodule

module ANDNANDS(sinal,a,b);
input a,b;
output sinal;


nand NAND1(temp3,a,b);
nor NAND2(sinal,temp3,temp3);


 endmodule
 
 
 
module NOTNANDS(temp0,n);
input n;
output temp0;

nand NAND1(temp0,n,n);

 endmodule
 
 module MEIADIFERENCA(diferenca,sinal,a,b);
	input a, b;
	output diferenca,sinal;

 
  
  XORNANDS XOR1(diferenca,a,b);
  NOTNANDS NOT1(temp0,a);
  ANDNANDS AND1(sinal,temp0,b);
  
  
  

   endmodule

 module TESTEMEIADIFERENCA;

	reg a,b,c;
	wire diferenca,sinal;

	MEIADIFERENCA MEIADIFERENCA1 (temp1,carry,a,b);
	MEIADIFERENCA MEIADIFERENCA2(diferenca,carry2,temp1,c);
	ORNANDS ORNANDS1(sinal,carry2,carry);

	initial begin
		a = 0;b = 0;c=0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | c | Sinal  | Diferenca ");
		$monitor (" %b | %b | %b |   %b    |  %b", a,b,c,sinal,diferenca);
		#1 a = 0;b = 0;c=1;
		#1 a = 0;b = 1;c=0;
		#1 a = 0;b = 1;c=1;
		#1 a = 1;b = 0;c=0;
		#1 a = 1;b = 0;c=1;
		#1 a = 1;b = 1;c=0;
		#1 a = 1;b = 1;c=1;


	end	
     endmodule
