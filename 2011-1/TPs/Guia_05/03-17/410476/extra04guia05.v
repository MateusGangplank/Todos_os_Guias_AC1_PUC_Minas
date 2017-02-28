module MEIASOMANAND(soma,carry,a,b);
output soma,carry;
input a,b;
wire temp1,temp2,temp3,temp4;

nand NAND1 (temp1,a,b);
nand NAND2 (temp2,temp1,a);
nand NAND3 (temp3,temp1,b);
nand NAND4 (soma,temp2,temp3);
nand NAND5 (temp4,a,b);
nand NAND6 (carry,temp4,temp4);

 endmodule


module SOMACOMPLETANAND(soma,carry,a,b,c);

output soma,carry;
input a,b,c;
wire temp1,temp2,temp3,tmp4,temp5;

MEIASOMANAND MEIASOMA1 (temp1,temp2,a,b);
MEIASOMANAND MEIASOMA2 (soma,temp3,temp1,c);
nand NAND1(temp4,temp2,temp2); 
nand NAND2(temp5,temp3,temp3);
nand NAND3(carry,temp4,temp5);


 endmodule


module SOMACOMPLETANAND3BITS(soma,carry,a,b);

input [2:0]a,b;
output [2:0]soma;
output carry;
wire temp1,temp2;

MEIASOMANAND MEIASOMA1 (soma[0],temp1,a[0],b[0]);
SOMACOMPLETANAND SOMACOMPLETA1 (soma[1],temp2,a[1],b[1],temp1);
SOMACOMPLETANAND SOMACOMPLETA2 (soma[2],carry,a[2],b[2],temp2);

 endmodule

module TESTESOMADOR3BITS;
reg [2:0]a,b;
wire [2:0]soma;
wire carry;
integer i,j;


SOMACOMPLETANAND3BITS SOMACOMPLETA1 (soma,carry,a,b);

initial begin: start
		a=0; b=0;
end


	initial begin:main

		$display(" Larissa Fernandes Leijoto - 410476 ");
		#1 $display(" a | b = carry | soma ");
		#1 $monitor(" %3b | %3b =   %b  | %3b", a,b,carry,soma);

		for( i=0; i<=7; i = i+1 )
		begin
			a = i;
			for ( j=0; j<=7; j = j+1 )
			begin
				#1 b = j;
			end
		end

	end

endmodule
