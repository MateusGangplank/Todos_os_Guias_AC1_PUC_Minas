// ---------------------
// Guia 05_03 - Produto completo de dois valores binarios
// Nome: Heitor Terozendi
// Matricula: 396698
// ---------------------

//--- Module meia soma ---


module metodomeiasoma(s, vai,e1,e2);
output s, v;
input e1,e2;

xor xor1 (s,e1,e2);
and and1 (vai,e1,e2);

endmodule 

// -- Module soma completa --
module metodosomacompleta (soma, vaium, e1, e2, vemum);
output soma, vaium;
input e1,e2,vemum;
wire vai2;

metodomeiasoma MeiaSoma1 (s,vai,e1,e2);
metodomeiasoma MeiaSoma2 (soma,vai2,s,vemum);
or OR1 (vaium,vai2,vai);


endmodule


// -- Module somador 4 bits --
module metodoSomador4bits(s,vaium,e1,e2);

output [3:0]s;
output vaium;
input [3:0]e1,e2;
wire vaium1,vaium2,vaium3;

metodomeiasoma MEIASOMA (s[0],vaium1,e1[0],e2[0]);
metodosomacompleta SOMACOMPLETA1 (s[1],vaium2,e1[1],e2[1],vaium1);
metodosomacompleta SOMACOMPLETA2 (s[2],vaium3,e1[2],e2[2],vaium2);
metodosomacompleta SOMACOMPLETA3 (s[3],vaium,e1[3],e2[3],vaium3);

endmodule

// -- Module multiplicador 3 bits
module metodoMultiplicador3bits(x,s0,vaium,e1,e2);

output [3:0]x;
output vaium;
output s0;
input [3:0]e1,e2;
wire [3:0]a,b,temp2,s;
wire vaium1;


and AND13 (s0,e1[0],e2[0]);
and AND2 (b[0],e1[0],e2[1]);
and AND3 (b[1],e1[1],e2[1]);
and AND4 (b[2],e1[2],e2[1]);
and AND12 (b[3],0,0);
and AND5 (a[0],e1[1],e2[0]);
and AND10 (a[1],0,0);
and AND11 (a[2],0,0);
and AND6 (a[3],e1[2],e2[1]);

and AND7 (temp2[0],e1[2],e2[2]);
and AND8 (temp2[1],e1[1],e2[2]);
and AND9 (temp2[2],e1[0],e2[2]);
and AND14 (temp2[3],0,0);

metodoSomador4bits SOMADOR1(s,vaium1,a,b);
metodoSomador4bits SOMADOR2(x,vaium,s,temp2);


endmodule

// -- Module teste multiplicar ---

module testmultiplicador3bits;
reg [3:0]e1,e2;
wire [3:0]x;
wire vaium;
integer p,q;
 

metodoMultiplicador3bits MULTIPLICADOR(x,s0,vaium,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main

	   $display("Guia 05_03 - Produto completo de dois valores binarios");
		$display("Nome: Heitor Terozendi - Matricula: 396698");
		#1 $display(" e1 + e2 = vai   s ");
		#1 $monitor(" %4b + %4b = %b    %4b%b", e1,e2,vaium,x,s0);

		for( p=0; p<=7; p = p+1 )
		begin
			e1 = p;
			for ( q=0; q<=7; q = q+1 )
			begin
				#1 e2 = q;
			end
		end

	end

endmodule
