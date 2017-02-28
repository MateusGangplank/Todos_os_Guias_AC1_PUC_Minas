// Nome: Giselle Caroline Vieira
// Matrícula: 424649

module metodomeiasomanand(soma,carry,e1,e2);
output soma,carry;
input e1,e2;
wire temp1,temp2,temp3,temp4;

nand NAND1 (temp1,e1,e2);
nand NAND2 (temp2,temp1,e1);
nand NAND3 (temp3,temp1,e2);
nand NAND4 (soma,temp2,temp3);
nand NAND5 (temp4,e1,e2);
nand NAND6 (carry,temp4,temp4);

endmodule


module metodosomacompletanand(soma,carry,e1,e2,e3);

output soma,carry;
input e1,e2,e3;
wire temp1,temp2,temp3,tmp4,temp5;

metodomeiasomanand MEIASOMA1 (temp1,temp2,e1,e2);
metodomeiasomanand MEIASOMA2 (soma,temp3,temp1,e3);
nand NAND1(temp4,temp2,temp2); 
nand NAND2(temp5,temp3,temp3);
nand NAND3(carry,temp4,temp5);


endmodule


module metodosomacompleta3bits(soma,carry,e1,e2);

output [2:0]soma;
output carry;
input [2:0]e1,e2;
wire carry1,carry2;

metodomeiasomanand MEIASOMA1 (soma[0],carry1,e1[0],e2[0]);
metodosomacompletanand SOMACOMPLETA1 (soma[1],carry2,e1[1],e2[1],carry1);
metodosomacompletanand SOMACOMPLETA2 (soma[2],carry,e1[2],e2[2],carry2);

endmodule

module testsomador3bits;
reg [2:0]e1,e2;
wire [2:0]soma;
wire carry;
integer i,j;


metodosomacompleta3bits SOMACOMPLETA1 (soma,carry,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main

		$display("Circuito Soma Completa com 3 bits ");
		#1 $display(" e1 +     e2 = carry  saida ");
		#1 $monitor(" %4b + %4b =   %b    %4b", e1,e2,carry,soma);

		for( i=0; i<=7; i = i+1 )
		begin
			e1 = i;
			for ( j=0; j<=7; j = j+1 )
			begin
				#1 e2 = j;
			end
		end

	end

endmodule


