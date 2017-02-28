// Nome: Isabella Gonçales
// Matrícula: 420120

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


/* Registrando os resultados
  
    Circuito Soma Completa com 3 bits 
     e1 +     e2 = carry  saida 
      000 +  000 =   0     000
      000 +  001 =   0     001
      000 +  010 =   0     010
      000 +  011 =   0     011
      000 +  100 =   0     100
      000 +  101 =   0     101
      000 +  110 =   0     110
      001 +  111 =   1     000
      001 +  000 =   0     001
      001 +  001 =   0     010
      001 +  010 =   0     011
      001 +  011 =   0     100
      001 +  100 =   0     101
      001 +  101 =   0     110
      001 +  110 =   0     111
      010 +  111 =   1     001
      010 +  000 =   0     010
      010 +  001 =   0     011
      010 +  010 =   0     100
      010 +  011 =   0     101
      010 +  100 =   0     110
      010 +  101 =   0     111
      010 +  110 =   1     000
      011 +  111 =   1     010
      011 +  000 =   0     011
      011 +  001 =   0     100
      011 +  010 =   0     101
      011 +  011 =   0     110
      011 +  100 =   0     111
      011 +  101 =   1     000
      011 +  110 =   1     001
      100 +  111 =   1     011
      100 +  000 =   0     100
      100 +  001 =   0     101
      100 +  010 =   0     110
      100 +  011 =   0     111
      100 +  100 =   1     000
      100 +  101 =   1     001
      100 +  110 =   1     010
      101 +  111 =   1     100
      101 +  000 =   0     101
      101 +  001 =   0     110
      101 +  010 =   0     111
      101 +  011 =   1     000
      101 +  100 =   1     001
      101 +  101 =   1     010
      101 +  110 =   1     011
      110 +  111 =   1     101
      110 +  000 =   0     110
      110 +  001 =   0     111
      110 +  010 =   1     000
      110 +  011 =   1     001
      110 +  100 =   1     010
      110 +  101 =   1     011
      110 +  110 =   1     100
      111 +  111 =   1     110
      111 +  000 =   0     111
      111 +  001 =   1     000
      111 +  010 =   1     001
      111 +  011 =   1     010
      111 +  100 =   1     011
      111 +  101 =   1     100
      111 +  110 =   1     101
      111 +  111 =   1     110
    
     ----jGRASP: operation complete.
    
*/

