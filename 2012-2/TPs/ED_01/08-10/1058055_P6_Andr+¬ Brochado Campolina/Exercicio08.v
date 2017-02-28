//-----
//Exercicio08
//Andre Campolina
//381217
//-----

//---
//and 4 entradas
//---

module and4entradas(output s, input [0:3] p);
	assign s = p[0]&p[1]&p[2]&p[3];
endmodule

//---
//testar
//---

module testaand;
	reg [0:3] a;
	wire s;
	
	and4entradas AND41(s,a);
	
	initial begin:start
		a=0;
	end
	
	initial begin
		$display("Exercicio08 - Andre Campolina - 381217");
		$display("Tabela Verdade porta AND 4 entradas");
		$display("\na b c d\ts\n");
		$monitor("%b \t%b",a,s);
		#1 a=1;
		#1 a=2;
		#1 a=3;
		#1 a=4;
		#1 a=5;
		#1 a=6;
		#1 a=7;
		#1 a=8;
		#1 a=9;
		#1 a=10;
		#1 a=11;
		#1 a=12;
		#1 a=13;
		#1 a=14;
		#1 a=4'b1111;
	end
endmodule