module XORNORS(temp5,a,b);
input a,b;
output temp5;


nor NOR1(temp1,a,a);
nor NOR2(temp2,b,b);
nor NOR2(temp3,temp1,temp2);
nor NOR2(temp4,a,b);
nor NOR2(temp5,temp3,temp4);


 endmodule

module ORNORS(temp2,a,b);

input a,b;
output temp2;


nor NOR1(temp1,a,b);
nor NOR2(temp2,temp1,temp1);

 endmodule

module ANDNORS(sinal,a,b);
input a,b;
output sinal;


nor NOR1(temp3,b,b);
nor NOR2(temp4,a,a);
nor NOR3(sinal,temp3,temp4);

 endmodule
 
 
 
module NOTNORS(temp0,n);
input n;
output temp0;

nor NOR1(temp0,n,n);

 endmodule
 
 module MEIADIFERENCA(diferenca,sinal,a,b);
	input a, b;
	output diferenca,sinal;

 
  
  XORNORS XOR1(diferenca,a,b);
  NOTNORS NOT1(temp0,a);
  ANDNORS AND1(sinal,temp0,b);
  
  
  

   endmodule

 module TESTEMEIADIFERENCA;

	reg a,b;
	wire diferenca,sinal;

	MEIADIFERENCA MEIADIFERENCA1 (diferenca,sinal,a,b);

	initial begin
		a = 0;b = 0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | Diferenca | sinal");
		$monitor (" %b | %b |   %b       |  %b", a,b,diferenca,sinal);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;


	end	
     endmodule
